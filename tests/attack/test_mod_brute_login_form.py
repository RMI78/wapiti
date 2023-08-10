from os.path import join as path_join
from asyncio import Event
from unittest.mock import AsyncMock

import httpx
import respx
import pytest

from wapitiCore.net.classes import CrawlerConfiguration
from wapitiCore.net import Request
from wapitiCore.net.crawler import AsyncCrawler
from wapitiCore.attack.mod_brute_login_form import ModuleBruteLoginForm


# Test no form detected
@pytest.mark.asyncio
@respx.mock(base_url="http://perdu.com/")
async def test_no_form(respx_mock):
    respx_mock.get('/').mock(
        return_value=httpx.Response(
            200,
            text="<html><head><title>Vous Etes Perdu ?</title></head><body><h1>Perdu sur l'Internet ?</h1> \
            <h2>Pas de panique, on va vous aider</h2> \
            <strong><pre>    * <----- vous &ecirc;tes ici</pre></strong></body></html>",
        )
    )
    # Response to check that we have no more false positives
    # respx.get(url__regex=r"/.*?").mock(return_value=httpx.Response(404))
    persister = AsyncMock()
    request = Request("http://perdu.com/", referer="http://perdu.com/")
    request.path_id = 1


    crawler_configuration = CrawlerConfiguration(Request("http://perdu.com/"))
    async with AsyncCrawler.with_configuration(crawler_configuration) as crawler:
        options = {"timeout": 10, "level": 2, "tasks": 20}
        module = ModuleBruteLoginForm(crawler, persister, options, Event(), crawler_configuration)
        await module.attack(request)
        assert not persister.add_payload.call_count


@pytest.mark.asyncio
@respx.mock(base_url="http://perdu.com/")
async def test_easy_login_form(respx_mock):
    respx_mock.get("/auth").mock(
        return_value=httpx.Response(
            200,
            text="""<html>
                    <head>
                        <title>Vous Etes Perdu ?</title>
                    </head>
                    <body>
                        <h1>Perdu sur l'Internet ?</h1> 
                        <h2>Pas de panique, on va vous aider</h2> 
                        <strong><pre>    * <----- vous &ecirc;tes ici</pre></strong>
                        <form action="http://perdu.com/auth" method="post">
                            <label for="login">Login:</label>
                            <input type="text" id="login" name="login" required><br>
                            <label for="password">Password:</label>
                            <input type="password" id="password" name="password" required><br>
                        </form>
                    </body>
                    </html>"""
        )
    )
    respx_mock.post("/auth").mock(
        return_value=httpx.Response(200,
        text="""<html>
                <head>
                    <title>Vous Etes Perdu ?</title>
                </head>
                <body>
                    <h1>Perdu sur l'Internet ?</h1> 
                    <h2>Pas de panique, on va vous aider</h2> 
                    <strong><pre>    * <----- vous &ecirc;tes ici</pre></strong>
                    <p>Authentication Success !</p>
                </body>
                </html>"""
        )
    )

    persister = AsyncMock()

    request = Request("http://perdu.com/auth", referer="http://perdu.com/auth")
    request.path_id = 1

    crawler_configuration = CrawlerConfiguration(Request("http://perdu.com/auth"))
    async with AsyncCrawler.with_configuration(crawler_configuration) as crawler:
        options = {"timeout": 10, "level": 2, "tasks": 20}
        module = ModuleBruteLoginForm(crawler, persister, options, Event(), crawler_configuration)
        await module.attack(request)
        assert persister.add_payload.call_count == 1

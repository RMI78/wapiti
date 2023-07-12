(function(){"use strict";var e={5883:function(e,t,n){var o=n(9242),a=n(3396);function r(e,t){const n=(0,a.up)("router-link"),o=(0,a.up)("router-view");return(0,a.wg)(),(0,a.iD)(a.HY,null,[(0,a._)("nav",null,[(0,a.Wm)(n,{to:"/"},{default:(0,a.w5)((()=>[(0,a.Uk)("Home")])),_:1}),(0,a.Uk)(" | "),(0,a.Wm)(n,{to:"/services"},{default:(0,a.w5)((()=>[(0,a.Uk)("Services")])),_:1}),(0,a.Uk)(" | "),(0,a.Wm)(n,{to:"/contact"},{default:(0,a.w5)((()=>[(0,a.Uk)("Contact")])),_:1}),(0,a.Uk)(" | "),(0,a.Wm)(n,{to:"/login"},{default:(0,a.w5)((()=>[(0,a.Uk)("Log in")])),_:1}),(0,a.Uk)(" | "),(0,a.Wm)(n,{to:"/about"},{default:(0,a.w5)((()=>[(0,a.Uk)("About")])),_:1})]),(0,a.Wm)(o)],64)}var i=n(1481);const l={},u=(0,i.Z)(l,[["render",r]]);var s=u,m=n(2483),c=n(7139);const d=(0,a._)("h1",null,"Welcome to Realistic Vue.js Website",-1),f=["src","alt"];function p(e,t,n,o,r,i){const l=(0,a.up)("router-view");return(0,a.wg)(),(0,a.iD)("div",null,[d,(0,a._)("div",null,[((0,a.wg)(!0),(0,a.iD)(a.HY,null,(0,a.Ko)(r.images,(e=>((0,a.wg)(),(0,a.iD)("div",{key:e.id},[(0,a._)("img",{src:e.url,alt:e.alt},null,8,f),(0,a._)("p",null,(0,c.zw)(e.description),1)])))),128))]),(0,a._)("button",{onClick:t[0]||(t[0]=(...e)=>i.handleClick&&i.handleClick(...e))},"Click me!"),(0,a.Wm)(l)])}var v={name:"HeadlessHome",data(){return{images:[{id:1,url:"https://example.com/image1.jpg",alt:"Image 1",description:"This is the first image description."},{id:2,url:"https://example.com/image2.jpg",alt:"Image 2",description:"This is the second image description."},{id:3,url:"https://example.com/image3.jpg",alt:"Image 3",description:"This is the third image description."}]}},methods:{handleClick(){window.location="/contact",console.log("Button clicked!")}}};const g=(0,i.Z)(v,[["render",p]]);var h=g;const b=(0,a._)("h2",null,"Our Services",-1),w=(0,a._)("p",null,"This is the services page.",-1),_=[b,w];function k(e,t,n,o,r,i){return(0,a.wg)(),(0,a.iD)("div",null,_)}var D={name:"HeadlessServices"};const y=(0,i.Z)(D,[["render",k]]);var U=y;const O=(0,a._)("h2",null,"Contact Us",-1),F=(0,a._)("label",{for:"name"},"Name:",-1),j=(0,a._)("label",{for:"email"},"Email:",-1),x=(0,a._)("label",{for:"message"},"Message:",-1),C=(0,a._)("button",{type:"submit"},"Submit",-1);function H(e,t,n,r,i,l){return(0,a.wg)(),(0,a.iD)("div",null,[O,(0,a._)("form",{onSubmit:t[3]||(t[3]=(0,o.iM)(((...e)=>l.submitForm&&l.submitForm(...e)),["prevent"]))},[F,(0,a.wy)((0,a._)("input",{type:"text",id:"name","onUpdate:modelValue":t[0]||(t[0]=e=>i.formData.name=e),required:""},null,512),[[o.nr,i.formData.name]]),j,(0,a.wy)((0,a._)("input",{type:"email",id:"email","onUpdate:modelValue":t[1]||(t[1]=e=>i.formData.email=e),required:""},null,512),[[o.nr,i.formData.email]]),x,(0,a.wy)((0,a._)("textarea",{id:"message","onUpdate:modelValue":t[2]||(t[2]=e=>i.formData.message=e),required:""},null,512),[[o.nr,i.formData.message]]),C],32)])}var W={name:"HeadlessContact",data(){return{formData:{name:"",email:"",message:""}}},methods:{submitForm(){console.log("Form submitted!"),console.log("Form data:",this.formData)}}};const S=(0,i.Z)(W,[["render",H]]);var T=S;const V=(0,a._)("h2",null,"About Us",-1),Z=(0,a._)("p",null,"This is the about page.",-1),q=[V,Z];function M(e,t,n,o,r,i){return(0,a.wg)(),(0,a.iD)("div",null,q)}var P={name:"HeadlessAbout"};const A=(0,i.Z)(P,[["render",M]]);var E=A;const I=(0,a._)("h2",null,"Log in !",-1),L=(0,a._)("label",{for:"email"},"Email:",-1),N=(0,a._)("label",{for:"password"},"Name:",-1),Y=(0,a._)("button",{type:"submit"},"Submit",-1);function z(e,t,n,r,i,l){return(0,a.wg)(),(0,a.iD)("div",null,[I,(0,a._)("form",{onSubmit:t[2]||(t[2]=(0,o.iM)(((...e)=>l.submitForm&&l.submitForm(...e)),["prevent"]))},[L,(0,a.wy)((0,a._)("input",{type:"email",id:"email","onUpdate:modelValue":t[0]||(t[0]=e=>i.formData.email=e),required:""},null,512),[[o.nr,i.formData.email]]),N,(0,a.wy)((0,a._)("input",{type:"password",id:"password","onUpdate:modelValue":t[1]||(t[1]=e=>i.formData.name=e),required:""},null,512),[[o.nr,i.formData.name]]),Y],32)])}var B={name:"HeadlessLogin",data(){return{formData:{name:"",email:"",message:""}}},methods:{submitForm(){console.log("Form submitted!"),console.log("Form data:",this.formData)}}};const K=(0,i.Z)(B,[["render",z]]);var R=K;const G=[{path:"/",name:"home",component:h},{path:"/about",name:"about",component:E},{path:"/services",name:"services",component:U},{path:"/contact",name:"contact",component:T},{path:"/login",name:"login",component:R}],J=(0,m.p7)({history:(0,m.PP)(),routes:G});var Q=J;(0,o.ri)(s).use(Q).mount("#app")}},t={};function n(o){var a=t[o];if(void 0!==a)return a.exports;var r=t[o]={exports:{}};return e[o].call(r.exports,r,r.exports,n),r.exports}n.m=e,function(){var e=[];n.O=function(t,o,a,r){if(!o){var i=1/0;for(m=0;m<e.length;m++){o=e[m][0],a=e[m][1],r=e[m][2];for(var l=!0,u=0;u<o.length;u++)(!1&r||i>=r)&&Object.keys(n.O).every((function(e){return n.O[e](o[u])}))?o.splice(u--,1):(l=!1,r<i&&(i=r));if(l){e.splice(m--,1);var s=a();void 0!==s&&(t=s)}}return t}r=r||0;for(var m=e.length;m>0&&e[m-1][2]>r;m--)e[m]=e[m-1];e[m]=[o,a,r]}}(),function(){n.n=function(e){var t=e&&e.__esModule?function(){return e["default"]}:function(){return e};return n.d(t,{a:t}),t}}(),function(){n.d=function(e,t){for(var o in t)n.o(t,o)&&!n.o(e,o)&&Object.defineProperty(e,o,{enumerable:!0,get:t[o]})}}(),function(){n.g=function(){if("object"===typeof globalThis)return globalThis;try{return this||new Function("return this")()}catch(e){if("object"===typeof window)return window}}()}(),function(){n.o=function(e,t){return Object.prototype.hasOwnProperty.call(e,t)}}(),function(){var e={143:0};n.O.j=function(t){return 0===e[t]};var t=function(t,o){var a,r,i=o[0],l=o[1],u=o[2],s=0;if(i.some((function(t){return 0!==e[t]}))){for(a in l)n.o(l,a)&&(n.m[a]=l[a]);if(u)var m=u(n)}for(t&&t(o);s<i.length;s++)r=i[s],n.o(e,r)&&e[r]&&e[r][0](),e[r]=0;return n.O(m)},o=self["webpackChunkheadless"]=self["webpackChunkheadless"]||[];o.forEach(t.bind(null,0)),o.push=t.bind(null,o.push.bind(o))}();var o=n.O(void 0,[998],(function(){return n(5883)}));o=n.O(o)})();
tinymce.PluginManager.add("textpattern",function(a){function b(){return j&&(i.sort(function(a,b){return a.start.length>b.start.length?-1:a.start.length<b.start.length?1:0}),j=!1),i}function c(a){for(var c=b(),d=0;d<c.length;d++)if(0===a.indexOf(c[d].start)&&(!c[d].end||a.lastIndexOf(c[d].end)==a.length-c[d].end.length))return c[d]}function d(a,c,d){var e,f,g;for(e=b(),g=0;g<e.length;g++)if(f=e[g],f.end&&a.substr(c-f.end.length-d,f.end.length)==f.end)return f}function e(b){function e(){i=i.splitText(k),i.splitText(j-k-o),i.deleteData(0,n.start.length),i.deleteData(i.data.length-n.end.length,n.end.length)}var f,g,h,i,j,k,l,m,n,o,p;if(f=a.selection,g=a.dom,f.isCollapsed()&&(h=f.getRng(!0),i=h.startContainer,j=h.startOffset,l=i.data,o=b?1:0,3==i.nodeType&&(n=d(l,j,o),n&&(k=Math.max(0,j-o),k=l.lastIndexOf(n.start,k-n.end.length-1),k!==-1&&(m=g.createRng(),m.setStart(i,k),m.setEnd(i,j-o),n=c(m.toString()),n&&n.end&&!(i.data.length<=n.start.length+n.end.length))))))return p=a.formatter.get(n.format),p&&p[0].inline?(e(),a.formatter.apply(n.format,{},i),i):void 0}function f(){var b,d,e,f,g,h,i,j,k,l,m;if(b=a.selection,d=a.dom,b.isCollapsed()&&(i=d.getParent(b.getStart(),"p"))){for(k=new tinymce.dom.TreeWalker(i,i);g=k.next();)if(3==g.nodeType){f=g;break}if(f){if(j=c(f.data),!j)return;if(l=b.getRng(!0),e=l.startContainer,m=l.startOffset,f==e&&(m=Math.max(0,m-j.start.length)),tinymce.trim(f.data).length==j.start.length)return;j.format&&(h=a.formatter.get(j.format),h&&h[0].block&&(f.deleteData(0,j.start.length),a.formatter.apply(j.format,{},f),l.setStart(e,m),l.collapse(!0),b.setRng(l))),j.cmd&&a.undoManager.transact(function(){f.deleteData(0,j.start.length),a.execCommand(j.cmd)})}}}function g(){var b,c;c=e(),c&&(b=a.dom.createRng(),b.setStart(c,c.data.length),b.setEnd(c,c.data.length),a.selection.setRng(b)),f()}function h(){var b,c,d,f,g;b=e(!0),b&&(g=a.dom,c=b.data.slice(-1),/[\u00a0 ]/.test(c)&&(b.deleteData(b.data.length-1,1),d=g.doc.createTextNode(c),b.nextSibling?g.insertAfter(d,b.nextSibling):b.parentNode.appendChild(d),f=g.createRng(),f.setStart(d,1),f.setEnd(d,1),a.selection.setRng(f)))}var i,j=!0;i=a.settings.textpattern_patterns||[{start:"*",end:"*",format:"italic"},{start:"**",end:"**",format:"bold"},{start:"#",format:"h1"},{start:"##",format:"h2"},{start:"###",format:"h3"},{start:"####",format:"h4"},{start:"#####",format:"h5"},{start:"######",format:"h6"},{start:"1. ",cmd:"InsertOrderedList"},{start:"* ",cmd:"InsertUnorderedList"},{start:"- ",cmd:"InsertUnorderedList"}],a.on("keydown",function(a){13!=a.keyCode||tinymce.util.VK.modifierPressed(a)||g()},!0),a.on("keyup",function(a){32!=a.keyCode||tinymce.util.VK.modifierPressed(a)||h()}),this.getPatterns=b,this.setPatterns=function(a){i=a,j=!0}});
const menu=document.getElementById('menu');
menu?.addEventListener('click',()=>{const state=menu.getAttribute('aria-expanded')!=='true';menu.setAttribute('aria-expanded',String(state));document.getElementById('chapters').classList.toggle('visible',state)});
document.querySelectorAll('details.card').forEach(el=>el.addEventListener('toggle',()=>{if(el.open)el.querySelectorAll('iframe[data-src]').forEach(frame=>{frame.src=frame.dataset.src;delete frame.dataset.src})}));
function openHash(){if(!location.hash)return;const el=document.getElementById(decodeURIComponent(location.hash.slice(1)));if(!el)return;for(let p=el;p;p=p.parentElement)if(p.tagName==='DETAILS')p.open=true;el.scrollIntoView({block:'start'})}
addEventListener('hashchange',openHash);openHash();

// Reader-controlled expansion preserves the default collapsed document.
document.querySelectorAll('[data-study]').forEach(button=>button.addEventListener('click',()=>{
  const mode=button.dataset.study;
  document.querySelectorAll('details.card').forEach(card=>{
    const kind=card.querySelector('.kind')?.textContent.trim();
    card.open=mode==='content'||mode==='proofs'||(mode==='definitions'&&kind==='定义');
    card.querySelectorAll('details.proof').forEach(proof=>proof.open=mode==='proofs');
  });
}));
const search=document.getElementById('knowledge-search');
search?.addEventListener('input',()=>{
  const query=search.value.trim().toLocaleLowerCase();
  let count=0;
  document.querySelectorAll('#knowledge-results li').forEach(item=>{
    const match=item.textContent.toLocaleLowerCase().includes(query);
    item.hidden=!match;
    if(match)count++;
  });
  document.getElementById('knowledge-count').textContent=`找到 ${count} 个知识条目`;
});

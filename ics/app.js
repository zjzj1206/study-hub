const menu = document.getElementById('menu');
const chapters = document.getElementById('chapters');
menu?.addEventListener('click', () => {
  const open = menu.getAttribute('aria-expanded') !== 'true';
  menu.setAttribute('aria-expanded', String(open));
  chapters.classList.toggle('open', open);
});
document.addEventListener('keydown', event => {
  if (event.key === 'Escape') {
    chapters?.classList.remove('open');
    menu?.setAttribute('aria-expanded', 'false');
  }
});

// Native details work without JavaScript; chapter links progressively add filtering.
const quizSections = [...document.querySelectorAll('.quiz-page .quiz-chapter')];
const quizLinks = [...document.querySelectorAll('.quiz-chapter-link')];
function selectQuizChapter() {
  const id = decodeURIComponent(location.hash.slice(1));
  const target = document.getElementById(id);
  const selected = target?.closest('.quiz-chapter')?.dataset.chapter || 'all';
  quizSections.forEach(section => { section.hidden = selected !== 'all' && section.dataset.chapter !== selected; });
  quizLinks.forEach(link => {
    if (link.dataset.chapter === selected) link.setAttribute('aria-current', 'true');
    else link.removeAttribute('aria-current');
  });
  if (target && selected !== 'all') target.scrollIntoView({block: 'start'});
}
if (quizSections.length) {
  window.addEventListener('hashchange', selectQuizChapter);
  selectQuizChapter();
}
// Print all questions and answers, then restore the reader's disclosure state.
let quizPrintState = [];
window.addEventListener('beforeprint', () => {
  quizPrintState = [...document.querySelectorAll('.quiz-answer')].map(el => [el, el.open]);
  quizPrintState.forEach(([el]) => { el.open = true; });
});
window.addEventListener('afterprint', () => {
  quizPrintState.forEach(([el, open]) => { el.open = open; });
});

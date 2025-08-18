const sidebar = document.getElementById('sidebar');
const overlay = document.getElementById('overlay');
const btn = document.getElementById('menuBtn');
const mq = window.matchMedia('(max-width: 960px)');
function applyMobile(e) {
    btn.style.display = e.matches ? 'inline-block' : 'none';
    if (!e.matches) { sidebar.classList.remove('open'); overlay.classList.remove('show'); btn.setAttribute('aria-expanded', 'false'); }
}
mq.addEventListener('change', applyMobile); applyMobile(mq);
btn.addEventListener('click', () => { const open = sidebar.classList.toggle('open'); overlay.classList.toggle('show', open); btn.setAttribute('aria-expanded', String(open)); });
overlay.addEventListener('click', () => { sidebar.classList.remove('open'); overlay.classList.remove('show'); btn.setAttribute('aria-expanded', 'false'); });

// Scrollspy: realça seção ativa no sumário
const links = Array.from(document.querySelectorAll('#toc a'));
const io = new IntersectionObserver((entries) => {
    entries.forEach(e => { if (e.isIntersecting) { const id = '#' + e.target.id; links.forEach(l => l.classList.toggle('active', l.getAttribute('href') === id)); } });
}, { rootMargin: '0px 0px -70% 0px', threshold: [0, 1] });
document.querySelectorAll('section[id]').forEach(sec => io.observe(sec));

document.querySelectorAll('img.enlargeable').forEach(img => {
    img.addEventListener('click', () => {
        const modal = document.getElementById('imageModal');
        const modalImg = document.getElementById('modalImage');
        modalImg.src = img.src;
        modal.style.display = 'flex';
    });
});

const modal = document.getElementById('imageModal');

modal.addEventListener('click', () => {
    modal.style.display = 'none';
});

document.addEventListener('keydown', (event) => {
    if (event.key === "Escape") {
        modal.style.display = 'none';
    }
});

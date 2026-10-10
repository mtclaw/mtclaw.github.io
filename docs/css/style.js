/*
 * @Author: mtclaw kagamicannery@outlook.com
 * @Date: 2026-03-06 14:20:19
 * @LastEditors: mtclaw kagamicannery@outlook.com
 * @LastEditTime: 2026-10-11 03:26:09
 * @FilePath: \good_shape\html\css\style.js
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
const elements_bluefont = document.querySelectorAll('span.bluefont');
elements_bluefont.forEach(el => {
    el.textContent = '🞛 ' + el.textContent + ' 🞛';
});
const elements_redfont = document.querySelectorAll('span.redfont');
elements_redfont.forEach(el => {
    el.textContent = '🞧 ' + el.textContent + ' 🞧';
});
const elements_greenfont = document.querySelectorAll('span.greenfont');
elements_greenfont.forEach(el => {
    el.textContent = '♨ ' + el.textContent + ' ♨';
});
const elements_yellowfont = document.querySelectorAll('span.yellowfont');
elements_yellowfont.forEach(el => {
    el.textContent = '♡ ' + el.textContent + ' ♡';
});

document.addEventListener('DOMContentLoaded', function() 
{
    const links = document.querySelectorAll('a[href^="http"]');
    links.forEach(function(link)
    {
        if (!link.href.includes(window.location.hostname))
        {
            link.target = '_blank';
            link.rel = 'noopener noreferrer';
        }
    });
});

function toggleSidebar()
{
	const sidebar = document.getElementById('sidebar');
    const expandbtn = document.getElementById('expand-sidebar-btn');
    const maintext = document.getElementById('maintext');
    if(sidebar.classList.contains('hidden'))
    {
        expandbtn.classList.add('hidden');
        sidebar.classList.remove('hidden');
        maintext.style.width = '70%';
    }
    else
    {
        expandbtn.classList.remove('hidden');
        sidebar.classList.add('hidden');
        maintext.style.width = '92%';
    }
}

function returnToTop()
{
    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    });
}

function toggleLightDark()
{
    const html = document.documentElement;
    const next = html.dataset.theme === 'dark' ? 'light' : 'dark';
    html.dataset.theme = next;
    localStorage.setItem('theme', next);
    const expandbtn = document.getElementById('toggle-theme-btn');
    if (html.dataset.theme == 'dark') {
        expandbtn.textContent = '☀';
    }
    else {
        expandbtn.textContent = '☽';
    }
}
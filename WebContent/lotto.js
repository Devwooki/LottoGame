let lottoArr = [],
  num,
  loc,
  ballColor = ['#645356', '#5491ce', '#6ce089', '#e06cce', '#aa5b66'];

function numberChange() {
  let ind = Math.floor(Math.random() * lottoArr.length);
  let lottoSpan = document.querySelector(`#lottoSpan${loc}`);
  lottoSpan.innerHTML = `${lottoArr[ind]}`;
  lottoSpan.style.background = `${ballColor[parseInt(lottoArr[ind] / 10)]}`;

  if (num !== 0) {
    num--;
    setTimeout(numberChange, 100);
    return;
  }
  console.log(lottoArr[ind]);
  let lottoTrs = document.querySelectorAll(`#lottoTbl tr`);
  lottoTrs.forEach((tr) => {
    let tdList = tr.children;
    for (let i = 1; i < 7; i++) {
      let td = tdList[i];
      if (td.innerText == lottoArr[ind]) {
        td.className = 'choice';
        tdList[7].innerText = parseInt(tdList[7].innerText) + 1;
      }
    }
  });

  lottoArr.splice(ind, 1);

  num = 30;
  loc++;
  if (loc < 7) {
    setTimeout(numberChange, 100);
  }
}

document.getElementById('lottoBtn').onclick = () => {
  // 추첨번호를 눌렀을 때의 초기화
  lottoArr.splice(0, lottoArr.length);
  loc = 1;
  var spanArr = document.querySelectorAll("span[id^='lottoSpan']");
  for (let sEle of spanArr) sEle.innerHTML = '';

  // 초기 번호 설정
  for (var i = 0; i < 45; i++) lottoArr[i] = i + 1;

  num = 30;
  numberChange();
};

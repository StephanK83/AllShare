class MagicFocus {
  constructor(parent) {
    this.parent = parent;
    if (!this.parent) return;

    this.focus = document.createElement('div');
    this.focus.classList.add('magic-focus');
    this.parent.classList.add('has-magic-focus');
    this.parent.appendChild(this.focus);

    const inputs = this.parent.querySelectorAll('input, textarea, select');
    for (let input of inputs) {
      input.addEventListener('focus', () => {
        window.magicFocus.show();
      });
      input.addEventListener('blur', () => {
        window.magicFocus.hide();
      });
    }
  }

  show() {
    const el = document.activeElement;
    if (!['INPUT', 'SELECT', 'TEXTAREA'].includes(el.nodeName)) return;

    clearTimeout(this.reset);

    let forAttr = el.getAttribute('for');
    if (['checkbox', 'radio'].includes(el.type)) {
      forAttr = el.id;
    }
    const labelEl = document.querySelector(`[for=${forAttr}]`);
    const elTop = el.offsetTop || 0;
    const elLeft = el.offsetLeft || 0;
    const elWidth = el.offsetWidth || 0;
    const elHeight = el.offsetHeight || 0;
    this.focus.style.top = `${elTop}px`;
    this.focus.style.left = `${elLeft}px`;
    this.focus.style.width = `${elWidth}px`;
    this.focus.style.height = `${elHeight}px`;

    const previewNameEl = document.querySelector('#preview-name');
    const previewCategoryEl = document.querySelector('#preview-category');
    const previewDescriptionEl = document.querySelector('#preview-description');
    const previewPostalCodeEl = document.querySelector('#preview-postal-code');
    const previewQuantityEl = document.querySelector('#preview-quantity');
    const previewMinDaysRentEl = document.querySelector('#preview-min-days-rent');
    const previewPriceEl = document.querySelector('#preview-price');
    previewNameEl.textContent = document.querySelector('#item_name').value;
    previewCategoryEl.textContent = document.querySelector('#item_category').value;
    previewDescriptionEl.textContent = document.querySelector('#item_description').value;
    previewPostalCodeEl.textContent = document.querySelector('#item_postal_code').value;
    previewQuantityEl.textContent = document.querySelector('#item_quantity').value;
    previewMinDaysRentEl.textContent = document.querySelector('#item_min_days_rent').value;
    previewPriceEl.textContent = document.querySelector('#item_price').value;

    const previewImageEl = document.querySelector('#preview-image');
    if (el.type === 'file' && el.files && el.files.length > 0) {
      previewImageEl.style.display = 'block';
      previewImageEl.src = URL.createObjectURL(el.files[0]);
    } else {
      previewImageEl.style.display = 'none';
      previewImageEl.removeAttribute('src');
    }
  }

  hide() {
    const el = document.activeElement;
    if (!['INPUT', 'SELECT', 'TEXTAREA', 'LABEL'].includes(el.nodeName)) {
      this.focus.style.width = '0';
    }

    this.reset = setTimeout(() => {
      this.focus.removeAttribute('style');
    }, 200);
  }
}

// Initialize
window.magicFocus = new MagicFocus(document.querySelector('.form'));

$(function() {
  $('.select').customSelect();
});

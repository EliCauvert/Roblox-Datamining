"use strict";
let o = "/unsupported-browser";
"u" > typeof globalThis && window.CSS && window.CSS.supports && window.CSS.supports("color", "var(--fake-var)") || (window.location.pathname !== o ? window.location.href = o : window.onload = () => {
    document.body.style.display = "block"
});
//# sourceMappingURL=index.cjs.map
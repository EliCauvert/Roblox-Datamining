local symbol = require(script.Parent.Parent.AppCommonLib).Symbol

return {
	Hidden = symbol.named("Hidden"),
	Closed = symbol.named("Closed"),
	Brief = symbol.named("Brief"),
	SuperBrief = symbol.named("SuperBrief"),
	Full = symbol.named("Full"),
	Extended = symbol.named("Extended")
}
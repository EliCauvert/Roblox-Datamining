local regexModule = require(script.Parent.Regex)
local var1 = regexModule.oneOf({
	regexModule.set("\\w\\-\\.\\_\\~\\!\\$\\&\\'\\*\\+\\,\\;\\=\\(\\)\\:\\@"),
	"\\%[A-Fa-f0-9]{2}"
})
local var2 = regexModule.oneOf({
	regexModule.set("\\w\\-\\.\\_\\~\\!\\$\\&\\'\\*\\+\\,\\;\\=\\(\\)\\:\\@\\/\\?"),
	"\\%[A-Fa-f0-9]{2}"
})
local var3 = regexModule.oneOf({
	regexModule.set("\\w\\-\\.\\_\\~\\!\\$\\&\\'\\*\\+\\,\\;\\=\\(\\)\\:\\@\\/\\?\\#"),
	"\\%[A-Fa-f0-9]{2}"
})
local list = { "https", "http" }
local list_1 = { "com", "net", "org", "[a-z]{2}" }
local text = "\\w(?:[\\w\\-]{0,61}\\w)?" .. regexModule.DOT .. regexModule.zeroOrMore(regexModule.oneOf(list_1) .. regexModule.DOT) .. regexModule.oneOf(list_1)

return {
	ANY_DOMAIN_NAME = "\\w(?:[\\w\\-]{0,61}\\w)?",
	PATH_CHAR = var1,
	QUERY_CHAR = var2,
	FRAGMENT_CHAR = var3,
	ANY_HOSTNAME_PATTERN = text,
	HTTP_PROTOCOL_PATTERNS = list,
	COMMON_TLD_PATTERNS = list_1,
	ANY_DOMAIN_PATTERN = text
}
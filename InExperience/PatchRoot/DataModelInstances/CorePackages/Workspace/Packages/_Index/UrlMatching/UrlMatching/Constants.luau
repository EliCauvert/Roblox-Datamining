local RegexModule = require(script.Parent.Regex)
local list = { "com", "net", "org", "[a-z]{2}" }
local Text = "\\w(?:[\\w\\-]{0,61}\\w)?" .. RegexModule.DOT .. RegexModule.zeroOrMore(RegexModule.oneOf(list) .. RegexModule.DOT) .. RegexModule.oneOf(list)

return {
	ANY_DOMAIN_NAME = "\\w(?:[\\w\\-]{0,61}\\w)?",
	PATH_CHAR = RegexModule.oneOf({
		RegexModule.set("\\w\\-\\.\\_\\~\\!\\$\\&\\'\\*\\+\\,\\;\\=\\(\\)\\:\\@"),
		"\\%[A-Fa-f0-9]{2}"
	}),
	QUERY_CHAR = RegexModule.oneOf({
		RegexModule.set("\\w\\-\\.\\_\\~\\!\\$\\&\\'\\*\\+\\,\\;\\=\\(\\)\\:\\@\\/\\?"),
		"\\%[A-Fa-f0-9]{2}"
	}),
	FRAGMENT_CHAR = RegexModule.oneOf({
		RegexModule.set("\\w\\-\\.\\_\\~\\!\\$\\&\\'\\*\\+\\,\\;\\=\\(\\)\\:\\@\\/\\?\\#"),
		"\\%[A-Fa-f0-9]{2}"
	}),
	ANY_HOSTNAME_PATTERN = Text,
	HTTP_PROTOCOL_PATTERNS = { "https", "http" },
	COMMON_TLD_PATTERNS = list,
	ANY_DOMAIN_PATTERN = Text
}
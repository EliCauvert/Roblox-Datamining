local VerificationPresentation = {
	Native = "Native",
	InAppWebView = "InAppWebView",
	ExternalLink = "ExternalLink"
}

return {
	VerificationPresentation = VerificationPresentation,
	resolveVerificationPresentation = function(p1, p2)
		-- upvalues: VerificationPresentation (copy)
		return if p1 then VerificationPresentation.Native elseif p2 then VerificationPresentation.InAppWebView else VerificationPresentation.ExternalLink
	end
}
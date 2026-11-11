local LaunchContext = require(script:FindFirstAncestor("ExternalAttribution").Parent.AppStartup).Enums.LaunchContext
local PostAuthenticationEvent = {
	Reopen = "Reopen",
	SignUp = "SignUp",
	Login = "Login",
	Unknown = "Unknown"
}

return {
	PostAuthenticationEvent = PostAuthenticationEvent,
	parseLaunchContextToPostAuthenticationEventType = function(Login)
		-- upvalues: LaunchContext (copy), PostAuthenticationEvent (copy)
		return if Login == LaunchContext.Startup then PostAuthenticationEvent.Reopen elseif Login == LaunchContext.SignUp then PostAuthenticationEvent.SignUp elseif Login == LaunchContext.Login then PostAuthenticationEvent.Login else PostAuthenticationEvent.Unknown
	end
}
local AppPage = require(script.Parent.Parent.RobloxAppEnums).AppPage

return function(p1)
	-- upvalues: AppPage (copy)
	local OdpSessionId: string = p1.odpSessionId
	
	return if type(OdpSessionId) == "string" and string.match(OdpSessionId, "^%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x$") then {
		{
			{
				name = AppPage.AmpV2Wizard,
				extraProps = {
					surface = "OdpWebViewHandoff",
					flow = {
						name = "OdpCheckpointResume",
						props = { odpSessionId = OdpSessionId }
					}
				}
			}
		}
	} else nil
end
local DiagnosticsModule = require("./diagnostics")
local config = {
	["not-a-host"] = {
		summary = "createRuntime expects a host table",
		contract = "a host implements the protocol in src/core/host.luau"
	},
	unnamed = {
		summary = "a host must name itself",
		contract = "host.name appears in every diagnostic Compose raises about this host",
		fix = "set host.name, e.g. \"roblox\""
	},
	["no-renderer"] = {
		summary = "host %q has no render capability",
		contract = "render is the one required capability"
	},
	["incomplete-renderer"] = {
		summary = "host %q is missing render.%s",
		contract = "every method in Renderer is required"
	},
	["incomplete-events"] = {
		summary = "host %q declares events without connectEvent",
		contract = "a declared capability must be complete",
		fix = "either implement connectEvent or omit host.events entirely"
	},
	["incomplete-observation"] = {
		summary = "host %q declares observation but does not implement it",
		contract = "observation requires both readProperty and observeProperty",
		fix = "either implement both or omit host.observation entirely"
	},
	["incomplete-styled-observation"] = {
		summary = "styled observation requires both host methods",
		contract = "readStyledProperty and observeStyledProperty must be supplied together"
	},
	["incomplete-naming"] = {
		summary = "host %q declares naming but does not implement it",
		contract = "naming requires setName",
		fix = "either implement setName or omit host.naming entirely"
	},
	["incomplete-frames"] = {
		summary = "host %q declares frames but does not implement it",
		contract = "frames requires both onFrame and now",
		fix = "either implement both or omit host.frames entirely"
	}
}

return function(Text, p1, p2, p3)
	-- upvalues: config (copy), DiagnosticsModule (copy)
	local Entry = config[Text]
	local Summary = Entry.summary
	
	if p1 ~= nil then
		Summary = Summary:format(p1, p3)
	end
	return DiagnosticsModule.raise("host/" .. Text, Summary, {
		contract = Entry.contract,
		fix = Entry.fix,
		actual = if Text == "not-a-host" or Text == "incomplete-renderer" then DiagnosticsModule.describe(p2) else nil,
		expected = if Text == "incomplete-renderer" then "a function" else nil
	})
end
local parent = script.Parent
local parent_1 = parent.Parent
local gameDetailsContextModule = require(parent.GameDetailsContext)
local reactModule = require(parent_1.Parent.React)
local _ = require(parent_1.gameInviteModalType)

return function(p0) --[[ line: 17 ]]
	-- upvalues: reactModule (ref), gameDetailsContextModule (ref)
	return reactModule.createElement(gameDetailsContextModule.Provider, {
		value = {
			gameDetails = p0.gameDetails or {},
			serverType = p0.serverType or "",
			promptMessage = p0.promptMessage or "",
			trigger = p0.trigger or "",
			isCoreScript = p0.isCoreScript or false
		}
	}, p0.children)
end
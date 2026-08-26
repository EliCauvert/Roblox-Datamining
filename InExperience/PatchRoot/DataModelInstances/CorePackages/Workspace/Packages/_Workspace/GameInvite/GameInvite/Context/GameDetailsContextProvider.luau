local parent = script.Parent
local parent_1 = parent.Parent
local gameDetailsContextModule = require(parent.GameDetailsContext)
local reactModule = require(parent_1.Parent.React)
local _ = require(parent_1.gameInviteModalType)

return function(p1)
	-- upvalues: reactModule (ref), gameDetailsContextModule (ref)
	return reactModule.createElement(gameDetailsContextModule.Provider, {
		value = {
			gameDetails = p1.gameDetails or {},
			serverType = p1.serverType or "",
			promptMessage = p1.promptMessage or "",
			trigger = p1.trigger or "",
			isCoreScript = p1.isCoreScript or false
		}
	}, p1.children)
end
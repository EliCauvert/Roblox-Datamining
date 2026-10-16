local Parent = script.Parent
local Parent1 = Parent.Parent
local GameDetailsContextModule = require(Parent.GameDetailsContext)
local ReactModule = require(Parent1.Parent.React)
local _ = require(Parent1.gameInviteModalType)

return function(p1) --[[ Line: 17 ]]
	-- upvalues: ReactModule (copy), GameDetailsContextModule (copy)
	return ReactModule.createElement(GameDetailsContextModule.Provider, {
		value = {
			gameDetails = p1.gameDetails or {},
			serverType = p1.serverType or "",
			promptMessage = p1.promptMessage or "",
			trigger = p1.trigger or "",
			isCoreScript = p1.isCoreScript or false
		}
	}, p1.children)
end
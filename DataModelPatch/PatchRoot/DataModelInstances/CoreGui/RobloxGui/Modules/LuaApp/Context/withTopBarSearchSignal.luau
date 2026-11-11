local CorePackages = game:GetService("CorePackages")
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local RoactModule = require(CorePackages.Packages.Roact)
local TopBarSearchSignalContextModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Context.TopBarSearchSignalContext)

return function(Render)
	-- upvalues: ArgCheckModule (copy), RoactModule (copy), TopBarSearchSignalContextModule (copy)
	ArgCheckModule.isNotNil(Render, "withTopBarSearchSignal must be passed a render prop")
	
	return RoactModule.createElement(TopBarSearchSignalContextModule.Consumer, { render = Render })
end
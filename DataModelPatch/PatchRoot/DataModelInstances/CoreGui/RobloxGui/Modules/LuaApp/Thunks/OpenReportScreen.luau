local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AppPageModule = require(Modules.LuaApp.AppPage)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)

return function(ReportData)
	-- upvalues: AppPageModule (copy), NavigateDownModule (copy)
	return function(p1)
		-- upvalues: AppPageModule (upval), ReportData (copy), NavigateDownModule (upval)
		p1:dispatch(NavigateDownModule({
			name = AppPageModule.ReportScreen,
			reportData = ReportData
		}))
	end
end
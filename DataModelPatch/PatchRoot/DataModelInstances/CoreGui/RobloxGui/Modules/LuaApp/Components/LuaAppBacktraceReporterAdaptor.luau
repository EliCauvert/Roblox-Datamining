local CorePackages = game:GetService("CorePackages")
local LocalizationService = game:GetService("LocalizationService")
local NotificationService = game:GetService("NotificationService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local EnableVirtualizedListBacktraceTag = game:DefineFastFlag("EnableVirtualizedListBacktraceTag", false)
local LuaAppBacktraceReporterModule = require(Modules.LuaApp.LuaAppBacktraceReporter)
local SafeCallModule = require(Modules.LuaApp.Util.safeCall)
local LuaAppBacktraceReporterAdaptor = require(CorePackages.Packages.Roact).PureComponent:extend("LuaAppBacktraceReporterAdaptor")

function LuaAppBacktraceReporterAdaptor:updateAppGenericAttributes(_)
	-- upvalues: SafeCallModule (copy), NotificationService (copy), LocalizationService (copy), LuaAppBacktraceReporterModule (copy), EnableVirtualizedListBacktraceTag (copy)
	LuaAppBacktraceReporterModule:updateSharedAttributes((SafeCallModule(function()
		-- upvalues: NotificationService (upval), LocalizationService (upval)
		return {
			AppTheme = tostring(NotificationService.SelectedTheme),
			Locale = tostring(LocalizationService.RobloxLocaleId)
		}
	end, {})))
	LuaAppBacktraceReporterModule:updateSharedAttributes({ RoactNavigationVersion = "0.5.3" })
	LuaAppBacktraceReporterModule:updateSharedAttributes({ Roact17Version = "17.0.1" })
	
	if EnableVirtualizedListBacktraceTag then
		LuaAppBacktraceReporterModule:updateSharedAttributes({ VirtualizedListVersion = "1.1.2" })
	end
end

function LuaAppBacktraceReporterAdaptor.updateStoreAnnotations(p1)
	-- upvalues: LuaAppBacktraceReporterModule (copy)
	LuaAppBacktraceReporterModule:updateSharedAnnotations(p1.props)
end

function LuaAppBacktraceReporterAdaptor.didMount(p1)
	p1:updateAppGenericAttributes(p1.props)
end

function LuaAppBacktraceReporterAdaptor:render()
	return nil
end

function LuaAppBacktraceReporterAdaptor.didUpdate(p1, _)
	p1:updateStoreAnnotations()
end

return (RoactRoduxModule.connect(function(p1, _)
	-- upvalues: SafeCallModule (copy)
	return SafeCallModule(function()
		-- upvalues: p1 (copy)
		return {
			FormFactor = p1.FormFactor,
			isLocalUserSoothsayer = p1.IsLocalUserSoothsayer,
			GlobalGuiInset = p1.GlobalGuiInset
		}
	end, {})
end)(LuaAppBacktraceReporterAdaptor))
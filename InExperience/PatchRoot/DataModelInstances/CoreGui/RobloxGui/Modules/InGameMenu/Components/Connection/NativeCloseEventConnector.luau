local GuiService = game:GetService("GuiService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local RoactRodux = InGameMenuDependenciesModule.RoactRodux
local T = InGameMenuDependenciesModule.t
local Parent = script.Parent.Parent.Parent
local OpenEducationalPopupModule = require(Parent.Thunks.OpenEducationalPopup)
local ExternalEventConnectionModule = require(Parent.Utility.ExternalEventConnection)
local InGameMenuPolicyModule = require(Parent.InGameMenuPolicy)
local UserLocalStoreModule = require(Parent.Utility.UserLocalStore)
local SendAnalyticsModule = require(Parent.Utility.SendAnalytics)
local ConstantsModule = require(Parent.Resources.Constants)
local NativeCloseEventConnector = Roact.PureComponent:extend("NativeCloseEventConnector")
NativeCloseEventConnector.validateProps = T.strictInterface({
	isEducationalPopupEnabled = T.boolean,
	maxDisplayCount = T.integer,
	openEducationalPopup = T.optional(T.callback)
})

function NativeCloseEventConnector.init(p1) --[[ Line: 26 ]]
	-- upvalues: RbxAnalyticsService (copy), UserLocalStoreModule (copy), GuiService (copy), SendAnalyticsModule (copy), ConstantsModule (copy)
	function p1.onNativeCloseConnect() --[[ Line: 27 ]]
		-- upvalues: p1 (copy), RbxAnalyticsService (upval), UserLocalStoreModule (upval), GuiService (upval), SendAnalyticsModule (upval), ConstantsModule (upval)
		if p1.props.isEducationalPopupEnabled then
			RbxAnalyticsService:ReportCounter("LeaveGame_NativeClose", 1)
			p1.props.openEducationalPopup(GuiService, UserLocalStoreModule.new(), p1.props.maxDisplayCount)
		end
		SendAnalyticsModule(ConstantsModule.AnalyticsInGameMenuName, "LeaveGame_NativeClose", {})
	end
end

function NativeCloseEventConnector.render(p1) --[[ Line: 39 ]]
	-- upvalues: Roact (copy), ExternalEventConnectionModule (copy), GuiService (copy)
	return Roact.createElement(ExternalEventConnectionModule, {
		event = GuiService.NativeClose,
		callback = p1.onNativeCloseConnect
	})
end

return RoactRodux.UNSTABLE_connect2(nil, function(Callback) --[[ Line: 53 ]]
	-- upvalues: OpenEducationalPopupModule (copy)
	return {
		openEducationalPopup = function(p1, p2, p3) --[[ Line: 55 ]]
			-- upvalues: Callback (copy), OpenEducationalPopupModule (upval)
			return Callback(OpenEducationalPopupModule(p1, p2, p3))
		end
	}
end)((InGameMenuPolicyModule.connect(function(p1, _) --[[ Line: 46 ]]
	return {
		isEducationalPopupEnabled = p1.enableEducationalPopup(),
		maxDisplayCount = p1.educationalPopupMaxDisplayCount()
	}
end)(NativeCloseEventConnector)))
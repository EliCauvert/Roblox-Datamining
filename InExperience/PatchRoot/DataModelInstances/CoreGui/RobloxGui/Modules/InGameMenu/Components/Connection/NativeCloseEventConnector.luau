local guiService = game:GetService("GuiService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local t = inGameMenuDependenciesModule.t
local parent = script.Parent.Parent.Parent
local openEducationalPopupModule = require(parent.Thunks.OpenEducationalPopup)
local externalEventConnectionModule = require(parent.Utility.ExternalEventConnection)
local inGameMenuPolicyModule = require(parent.InGameMenuPolicy)
local userLocalStoreModule = require(parent.Utility.UserLocalStore)
local sendAnalyticsModule = require(parent.Utility.SendAnalytics)
local constantsModule = require(parent.Resources.Constants)
local nativeCloseEventConnector = roact.PureComponent:extend("NativeCloseEventConnector")
nativeCloseEventConnector.validateProps = t.strictInterface({
	isEducationalPopupEnabled = t.boolean,
	maxDisplayCount = t.integer,
	openEducationalPopup = t.optional(t.callback)
})

function nativeCloseEventConnector.init(p0)
	-- upvalues: rbxAnalyticsService (ref), userLocalStoreModule (ref), guiService (ref), sendAnalyticsModule (ref), constantsModule (ref)
	function p0.onNativeCloseConnect()
		-- upvalues: p0 (ref), rbxAnalyticsService (copy), userLocalStoreModule (copy), guiService (copy), sendAnalyticsModule (copy), constantsModule (copy)
		if p0.props.isEducationalPopupEnabled then
			rbxAnalyticsService:ReportCounter("LeaveGame_NativeClose", 1)
			p0.props.openEducationalPopup(guiService, userLocalStoreModule.new(), p0.props.maxDisplayCount)
		end
		sendAnalyticsModule(constantsModule.AnalyticsInGameMenuName, "LeaveGame_NativeClose", {})
	end
end

function nativeCloseEventConnector.render(p1)
	-- upvalues: roact (ref), externalEventConnectionModule (ref), guiService (ref)
	return roact.createElement(externalEventConnectionModule, {
		event = guiService.NativeClose,
		callback = p1.onNativeCloseConnect
	})
end

return roactRodux.UNSTABLE_connect2(nil, function(p3)
	-- upvalues: openEducationalPopupModule (ref)
	return {
		openEducationalPopup = function(p4, p5, p6)
			-- upvalues: p3 (ref), openEducationalPopupModule (copy)
			return p3(openEducationalPopupModule(p4, p5, p6))
		end
	}
end)(inGameMenuPolicyModule.connect(function(p2, _)
	return {
		isEducationalPopupEnabled = p2.enableEducationalPopup(),
		maxDisplayCount = p2.educationalPopupMaxDisplayCount()
	}
end)(nativeCloseEventConnector))
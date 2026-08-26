local corePackagesService = game:GetService("CorePackages")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local t = inGameMenuDependenciesModule.t
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local pageModule = require(script.Parent.Parent.Page)
local closeMenuModule = require(script.Parent.Parent.Parent.Thunks.CloseMenu)
local VRComfortAutoToggleEntryModule = nil
local comfortSettingsEntryModule = nil

if game:GetEngineFeature("VRMoreComfortSettings") then
	VRComfortAutoToggleEntryModule = require(script.Parent.VRComfortAutoToggleEntry)
	comfortSettingsEntryModule = require(script.Parent.ComfortSettingsEntry)
end
local VRComfortSettingsPage = roact.PureComponent:extend("VRComfortSettingsPage")
VRComfortSettingsPage.validateProps = t.strictInterface({ closeMenu = t.callback, pageTitle = t.string })

local function _()
	local var1 = 0
	
	return function()
		-- upvalues: var1 (write)
		var1 += 1
		
		return var1
	end
end

function VRComfortSettingsPage.render(p1)
	-- upvalues: withFoundationOrUIBloxStyle (ref), roact (ref), pageModule (ref), comfortSettingsEntryModule (write), VRComfortAutoToggleEntryModule (write)
	return withFoundationOrUIBloxStyle(function(_)
		return {}
	end, function(_)
		-- upvalues: roact (copy), pageModule (copy), p1 (ref), comfortSettingsEntryModule (copy), VRComfortAutoToggleEntryModule (copy)
		local var1 = 0
		
		local var2 = function()
			-- upvalues: var1 (write)
			var1 += 1
			
			return var1
		end
		
		return roact.createElement(pageModule, {
			zIndex = 2,
			pageTitle = p1.props.pageTitle,
			position = p1.props.position
		}, {
			Layout = roact.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Top
			}),
			VRComfortSettings = if game:GetEngineFeature("VRMoreComfortSettings") then roact.createElement(comfortSettingsEntryModule, { LayoutOrder = var2() }) else nil,
			VignetteEnabled = if game:GetEngineFeature("VRMoreComfortSettings") then roact.createElement(VRComfortAutoToggleEntryModule, {
				labelKey = "CoreScripts.InGameMenu.GameSettings.VignetteEnabled",
				customValueKey = "VignetteEnabledCustomOption",
				derivedValueKey = "VignetteEnabled",
				LayoutOrder = var2()
			}) else nil,
			VRSteppedRotationEnabled = if game:GetEngineFeature("VRMoreComfortSettings") then roact.createElement(VRComfortAutoToggleEntryModule, {
				labelKey = "CoreScripts.InGameMenu.GameSettings.VRSteppedRotationEnabled",
				customValueKey = "VRSmoothRotationEnabledCustomOption",
				derivedValueKey = "VRSmoothRotationEnabled",
				checkedValue = false,
				LayoutOrder = var2()
			}) else nil,
			VRThirdPersonFixedCamEnabled = if game:GetEngineFeature("VRMoreComfortSettings") then roact.createElement(VRComfortAutoToggleEntryModule, {
				labelKey = "CoreScripts.InGameMenu.GameSettings.VRThirdPersonFixedCamEnabled",
				customValueKey = "VRThirdPersonFollowCamEnabledCustomOption",
				derivedValueKey = "VRThirdPersonFollowCamEnabled",
				checkedValue = false,
				LayoutOrder = var2()
			}) else nil
		})
	end)
end

return roactRodux.UNSTABLE_connect2(nil, function(p1)
	-- upvalues: closeMenuModule (ref)
	return {
		closeMenu = function()
			-- upvalues: p1 (ref), closeMenuModule (copy)
			p1(closeMenuModule)
		end
	}
end)(VRComfortSettingsPage)
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
	local var7 = 0
	
	return function()
		-- upvalues: var7 (write)
		var7 += 1
		
		return var7
	end
end

function VRComfortSettingsPage.render(p0)
	-- upvalues: withFoundationOrUIBloxStyle (ref), roact (ref), pageModule (ref), comfortSettingsEntryModule (write), VRComfortAutoToggleEntryModule (write)
	return withFoundationOrUIBloxStyle(function(_)
		return {}
	end, function(_)
		-- upvalues: roact (copy), pageModule (copy), p0 (ref), comfortSettingsEntryModule (copy), VRComfortAutoToggleEntryModule (copy)
		local var8 = 0
		
		local var9 = function()
			-- upvalues: var8 (write)
			var8 += 1
			
			return var8
		end
		
		return roact.createElement(pageModule, {
			zIndex = 2,
			pageTitle = p0.props.pageTitle,
			position = p0.props.position
		}, {
			Layout = roact.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Top
			}),
			VRComfortSettings = if game:GetEngineFeature("VRMoreComfortSettings") then roact.createElement(comfortSettingsEntryModule, { LayoutOrder = var9() }) else nil,
			VignetteEnabled = if game:GetEngineFeature("VRMoreComfortSettings") then roact.createElement(VRComfortAutoToggleEntryModule, {
				labelKey = "CoreScripts.InGameMenu.GameSettings.VignetteEnabled",
				customValueKey = "VignetteEnabledCustomOption",
				derivedValueKey = "VignetteEnabled",
				LayoutOrder = var9()
			}) else nil,
			VRSteppedRotationEnabled = if game:GetEngineFeature("VRMoreComfortSettings") then roact.createElement(VRComfortAutoToggleEntryModule, {
				labelKey = "CoreScripts.InGameMenu.GameSettings.VRSteppedRotationEnabled",
				customValueKey = "VRSmoothRotationEnabledCustomOption",
				derivedValueKey = "VRSmoothRotationEnabled",
				checkedValue = false,
				LayoutOrder = var9()
			}) else nil,
			VRThirdPersonFixedCamEnabled = if game:GetEngineFeature("VRMoreComfortSettings") then roact.createElement(VRComfortAutoToggleEntryModule, {
				labelKey = "CoreScripts.InGameMenu.GameSettings.VRThirdPersonFixedCamEnabled",
				customValueKey = "VRThirdPersonFollowCamEnabledCustomOption",
				derivedValueKey = "VRThirdPersonFollowCamEnabled",
				checkedValue = false,
				LayoutOrder = var9()
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
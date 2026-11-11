local CorePackages = game:GetService("CorePackages")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local RoactRodux = InGameMenuDependenciesModule.RoactRodux
local T = InGameMenuDependenciesModule.t
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local PageModule = require(script.Parent.Parent.Page)
local CloseMenuModule = require(script.Parent.Parent.Parent.Thunks.CloseMenu)
local VRComfortAutoToggleEntryModule = nil
local ComfortSettingsEntryModule = nil

if game:GetEngineFeature("VRMoreComfortSettings") then
	VRComfortAutoToggleEntryModule = require(script.Parent.VRComfortAutoToggleEntry)
	ComfortSettingsEntryModule = require(script.Parent.ComfortSettingsEntry)
end
local VRComfortSettingsPage = Roact.PureComponent:extend("VRComfortSettingsPage")
VRComfortSettingsPage.validateProps = T.strictInterface({ closeMenu = T.callback, pageTitle = T.string })

local function _()
	local v1 = 0
	
	return function(): number
		-- upvalues: v1 (ref)
		v1 += 1
		
		return v1
	end
end

function VRComfortSettingsPage.render(p1)
	-- upvalues: WithFoundationOrUIBloxStyleFunction (copy), Roact (copy), PageModule (copy), ComfortSettingsEntryModule (ref), VRComfortAutoToggleEntryModule (ref)
	return WithFoundationOrUIBloxStyleFunction(function(_)
		return {}
	end, function(_)
		-- upvalues: Roact (upval), PageModule (upval), p1 (copy), ComfortSettingsEntryModule (upval), VRComfortAutoToggleEntryModule (upval)
		local v1 = 0
		
		local function v13(): number
			-- upvalues: v1 (ref)
			v1 += 1
			
			return v1
		end
		
		return Roact.createElement(PageModule, {
			zIndex = 2,
			pageTitle = p1.props.pageTitle,
			position = p1.props.position
		}, {
			Layout = Roact.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Top
			}),
			VRComfortSettings = if game:GetEngineFeature("VRMoreComfortSettings") then Roact.createElement(ComfortSettingsEntryModule, { LayoutOrder = v13() }) else nil,
			VignetteEnabled = if game:GetEngineFeature("VRMoreComfortSettings") then Roact.createElement(VRComfortAutoToggleEntryModule, {
				labelKey = "CoreScripts.InGameMenu.GameSettings.VignetteEnabled",
				customValueKey = "VignetteEnabledCustomOption",
				derivedValueKey = "VignetteEnabled",
				LayoutOrder = v13()
			}) else nil,
			VRSteppedRotationEnabled = if game:GetEngineFeature("VRMoreComfortSettings") then Roact.createElement(VRComfortAutoToggleEntryModule, {
				labelKey = "CoreScripts.InGameMenu.GameSettings.VRSteppedRotationEnabled",
				customValueKey = "VRSmoothRotationEnabledCustomOption",
				derivedValueKey = "VRSmoothRotationEnabled",
				checkedValue = false,
				LayoutOrder = v13()
			}) else nil,
			VRThirdPersonFixedCamEnabled = if game:GetEngineFeature("VRMoreComfortSettings") then Roact.createElement(VRComfortAutoToggleEntryModule, {
				labelKey = "CoreScripts.InGameMenu.GameSettings.VRThirdPersonFixedCamEnabled",
				customValueKey = "VRThirdPersonFollowCamEnabledCustomOption",
				derivedValueKey = "VRThirdPersonFollowCamEnabled",
				checkedValue = false,
				LayoutOrder = v13()
			}) else nil
		})
	end)
end

return RoactRodux.UNSTABLE_connect2(nil, function(Callback)
	-- upvalues: CloseMenuModule (copy)
	return {
		closeMenu = function()
			-- upvalues: Callback (copy), CloseMenuModule (upval)
			Callback(CloseMenuModule)
		end
	}
end)(VRComfortSettingsPage)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local ContextualMenu = UIBloxModule.App.Menu.ContextualMenu
local MenuDirection = UIBloxModule.App.Menu.MenuDirection
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseNavigationFunction = require(CorePackages.Workspace.Packages.Navigation).useNavigation
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local WithOverlayFocusHandlingModule = require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local SelectIsPortraitModule = require(Modules.AvatarExperience.Common.Selectors.selectIsPortrait)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local ConstantsModule1 = require(Modules.LuaApp.Constants)
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local FixNilButtonCrashApp = game:DefineFastFlag("FixNilButtonCrashApp", false)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local v1 = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)(function(p1)
	-- upvalues: UseNavigationFunction (copy), UseDesignTokensFunction (copy), NavigationUtilsModule (copy), UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy), SelectIsPortraitModule (copy), ConstantsModule (copy), UtilsModule (copy), ConstantsModule1 (copy), ReactModule (copy), FixNilButtonCrashApp (copy), CryoModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), Focusable (copy), FFlagRenameDeprecatedUIBloxTokens (copy), ContextualMenu (copy), MenuDirection (copy)
	local UseNavigationResult = UseNavigationFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	
	local function OnDismiss()
		-- upvalues: NavigationUtilsModule (upval), UseNavigationResult (copy), p1 (copy)
		NavigationUtilsModule.closeOverlay(UseNavigationResult)
		
		if p1.onOverlayClosed ~= nil then
			p1.onOverlayClosed()
		end
	end
	
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.ScreenSize
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		return p2.GamepadBottomBar.boundInputs
	end, GetUseSelectorDeepEqualsFunction())
	local UseSelectorResult2 = UseSelectorFunction(SelectIsPortraitModule, GetUseSelectorDeepEqualsFunction())
	local LandscapeNavWidth = if UseSelectorResult2 then 0 else ConstantsModule.LandscapeNavWidth
	local LandscapeSceneWidth = if UseSelectorResult2 then 1 else ConstantsModule.LandscapeSceneWidth
	local Offset: number = if UtilsModule.getNumElementsWithKeyField(UseSelectorResult1) > 0 then -76 - ConstantsModule1.GAMEPAD_BOTTOM_BAR_SIZE else -76
	local _UDim2 = nil
	local _UDim2_1 = nil
	
	if p1.centered and not UseSelectorResult2 then
		local Smallest = math.min(UseSelectorResult.X, 640)
		_UDim2 = UDim2.fromOffset((UseSelectorResult.X - Smallest) / 2, 0)
		_UDim2_1 = UDim2.new(0, Smallest, 1, 0)
	else
		_UDim2 = UDim2.fromScale(LandscapeNavWidth, 0)
		_UDim2_1 = UDim2.fromScale(LandscapeSceneWidth, 1)
	end
	return ReactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then "Frame" else Focusable.Frame, {
		BackgroundTransparency = 1,
		Position = _UDim2,
		Size = _UDim2_1
	}, {
		SizeFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.fromScale(0.5, 0),
			Size = UDim2.fromScale(1, 1)
		}, {
			ContextMenuPadding = ReactModule.createElement("UIPadding", {
				PaddingRight = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_600 else UseDesignTokensResult.Global.Size_300),
				PaddingLeft = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_600 else UseDesignTokensResult.Global.Size_300)
			}),
			ContextMenu = ReactModule.createElement(ContextualMenu, {
				closeBackgroundVisible = true,
				open = true,
				buttonProps = ReactModule.useMemo(function()
					-- upvalues: p1 (copy), FixNilButtonCrashApp (upval), CryoModule (upval), UseNavigationResult (copy)
					return CryoModule.List.map(if FixNilButtonCrashApp then CryoModule.List.filter(p1.contextButtons, function(p2): boolean
						return p2 ~= nil
					end) else p1.contextButtons, function(p2)
						-- upvalues: CryoModule (upval), UseNavigationResult (upval)
						return if p2.onActivated then CryoModule.Dictionary.join(p2, {
							onActivated = function()
								-- upvalues: p2 (copy), UseNavigationResult (upval)
								p2.onActivated(UseNavigationResult)
							end
						}) else p2
					end)
				end, { p1.contextButtons, UseNavigationResult }),
				menuDirection = MenuDirection.Up,
				onDismiss = OnDismiss,
				openPositionY = UDim.new(1, Offset),
				screenSize = UseSelectorResult,
				contextMenuWidthOverride = UDim.new(1, 0)
			})
		})
	})
end)

if FFlagAXMigrateAXToGlobalAutofocus then
	v1 = WithOverlayFocusHandlingModule(v1)
end
return v1
local corePackagesService = game:GetService("CorePackages")
local contextActionService = game:GetService("ContextActionService")
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local appFonts = require(corePackagesService.Workspace.Packages.Style).AppFonts
local parent = script.Parent.Parent
local colorsModule = require(parent.Colors)
local constantsModule = require(parent.Constants)
local setTryingOnInfoModule = require(parent.Actions.SetTryingOnInfo)
local tryOnItemModule = require(parent.Thunks.TryOnItem)
local getSelectionImageObjectRoundedModule = require(parent.getSelectionImageObjectRounded)
local tryOn = require(script.Parent.Common.ControllerShortcutKeycodes).TryOn
local tryOnButton = roactModule.PureComponent:extend("TryOnButton")

function tryOnButton.init(p0) --[[ line: 22 ]]
	-- upvalues: getSelectionImageObjectRoundedModule (ref), contextActionService (ref), tryOn (ref)
	p0.selectedImage = getSelectionImageObjectRoundedModule()
	contextActionService:BindCoreAction("TryOnGamepadShortcut", function(_, p1, _) --[[ line: 25 ]]
		-- upvalues: p0 (ref)
		if p1 == Enum.UserInputState.End then
			p0:activateButton()
			
			return Enum.ContextActionResult.Sink
		end
		return Enum.ContextActionResult.Pass
	end, false, tryOn)
end

function tryOnButton.activateButton(p2) --[[ line: 34 ]]
	-- upvalues: constantsModule (ref)
	if not p2.props.showTryOn then return end
	local assetInfo = p2.props.assetInfo
	local tryOnItem = p2.props.tryOnItem
	local takeOffItem = p2.props.takeOffItem
	local tryingOn = p2.props.tryingOnInfo.tryingOn
	local partOfBundleAndOffsale = p2.props.partOfBundleAndOffsale
	local bundleId = p2.props.bundleId
	
	if not (assetInfo and (p2.props.localPlayerModel and (constantsModule.LayeredAssetTypes[assetInfo.assetTypeId] ~= nil and p2.props.localPlayerModel.Humanoid.RigType == Enum.HumanoidRigType.R6))) then
		if tryingOn then
			takeOffItem()
			
			return
		end
		tryOnItem(true, assetInfo.assetId, assetInfo.assetTypeId, partOfBundleAndOffsale, bundleId)
	end
end

function tryOnButton.willUnmount(_) --[[ line: 61 ]]
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction("TryOnGamepadShortcut")
end

function tryOnButton.render(p3) --[[ line: 65 ]]
	-- upvalues: constantsModule (ref), roactModule (ref), colorsModule (ref), robloxTranslatorModule (ref), appFonts (ref)
	local tryingOn = p3.props.tryingOnInfo.tryingOn
	local showTryOn = p3.props.showTryOn
	local locale = p3.props.locale
	local assetInfo = p3.props.assetInfo
	local var11 = assetInfo and (p3.props.localPlayerModel and (constantsModule.LayeredAssetTypes[assetInfo.assetTypeId] ~= nil and p3.props.localPlayerModel.Humanoid.RigType == Enum.HumanoidRigType.R6))
	
	return roactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		Image = "rbxasset://textures/ui/InspectMenu/Button_outline.png",
		AnchorPoint = Vector2.new(0.5, 0),
		Size = UDim2.new(0.5, -32, 0, 44),
		Visible = showTryOn,
		ImageTransparency = if var11 then 0.5 else 0,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(5, 5, 120, 20)
	}, {
		SelectionGainedImage = roactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Visible = false,
			Image = "rbxasset://textures/ui/InspectMenu/Button_white.png",
			Size = UDim2.new(1, 0, 1, 0),
			ImageColor3 = colorsModule.Pumice
		}),
		TryOnTextKey = roactModule.createElement("TextButton", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Text = robloxTranslatorModule:FormatByKeyForLocale(if tryingOn then "InGame.InspectMenu.Action.TakeOff" else "InGame.InspectMenu.Action.TryOn", locale),
			Font = appFonts.default:getDefault(),
			TextSize = 16,
			TextColor3 = colorsModule.White,
			TextTransparency = if var11 then 0.5 else 0,
			SelectionImageObject = p3.selectedImage,
			ZIndex = 2,
			[roactModule.Event.SelectionGained] = function(p4) --[[ line: 114 ]]
				-- upvalues: colorsModule (copy)
				p4.Parent.SelectionGainedImage.Visible = true
				p4.TextColor3 = colorsModule.Carbon
			end,
			[roactModule.Event.SelectionLost] = function(p5) --[[ line: 118 ]]
				-- upvalues: colorsModule (copy)
				p5.Parent.SelectionGainedImage.Visible = false
				p5.TextColor3 = colorsModule.White
			end,
			[roactModule.Ref] = p3.props.tryOnButtonRef,
			[roactModule.Event.Activated] = function() --[[ line: 123 ]]
				-- upvalues: p3 (ref)
				p3:activateButton()
			end
		})
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p6, _) --[[ line: 130 ]]
	return {
		locale = p6.locale,
		view = p6.view,
		assetInfo = p6.assets[p6.detailsInformation.assetId],
		bundleInfo = p6.bundles,
		tryingOnInfo = p6.tryingOnInfo
	}
end, function(p7) --[[ line: 140 ]]
	-- upvalues: tryOnItemModule (ref), setTryingOnInfoModule (ref)
	return {
		tryOnItem = function(p8, p9, p10, p11, p12) --[[ line: 142 ]]
			-- upvalues: p7 (ref), tryOnItemModule (copy)
			p7(tryOnItemModule(p8, p9, p10, p11, p12))
		end,
		takeOffItem = function() --[[ line: 145 ]]
			-- upvalues: p7 (ref), setTryingOnInfoModule (copy)
			p7(setTryingOnInfoModule(false, nil, nil))
		end
	}
end)(tryOnButton)
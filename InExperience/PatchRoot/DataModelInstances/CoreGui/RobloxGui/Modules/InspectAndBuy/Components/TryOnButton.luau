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

function tryOnButton.init(p1)
	-- upvalues: getSelectionImageObjectRoundedModule (ref), contextActionService (ref), tryOn (ref)
	p1.selectedImage = getSelectionImageObjectRoundedModule()
	contextActionService:BindCoreAction("TryOnGamepadShortcut", function(_, p2, _)
		-- upvalues: p1 (ref)
		if p2 == Enum.UserInputState.End then
			p1:activateButton()
			
			return Enum.ContextActionResult.Sink
		end
		return Enum.ContextActionResult.Pass
	end, false, tryOn)
end

function tryOnButton.activateButton(p1)
	-- upvalues: constantsModule (ref)
	if not p1.props.showTryOn then return end
	local assetInfo = p1.props.assetInfo
	local tryOnItem = p1.props.tryOnItem
	local takeOffItem = p1.props.takeOffItem
	local tryingOn = p1.props.tryingOnInfo.tryingOn
	local partOfBundleAndOffsale = p1.props.partOfBundleAndOffsale
	local bundleId = p1.props.bundleId
	
	if not (assetInfo and (p1.props.localPlayerModel and (constantsModule.LayeredAssetTypes[assetInfo.assetTypeId] ~= nil and p1.props.localPlayerModel.Humanoid.RigType == Enum.HumanoidRigType.R6))) then
		if tryingOn then
			takeOffItem()
			
			return
		end
		tryOnItem(true, assetInfo.assetId, assetInfo.assetTypeId, partOfBundleAndOffsale, bundleId)
	end
end

function tryOnButton.willUnmount(_)
	-- upvalues: contextActionService (ref)
	contextActionService:UnbindCoreAction("TryOnGamepadShortcut")
end

function tryOnButton.render(p1)
	-- upvalues: constantsModule (ref), roactModule (ref), colorsModule (ref), robloxTranslatorModule (ref), appFonts (ref)
	local tryingOn = p1.props.tryingOnInfo.tryingOn
	local showTryOn = p1.props.showTryOn
	local locale = p1.props.locale
	local assetInfo = p1.props.assetInfo
	local var1 = assetInfo and (p1.props.localPlayerModel and (constantsModule.LayeredAssetTypes[assetInfo.assetTypeId] ~= nil and p1.props.localPlayerModel.Humanoid.RigType == Enum.HumanoidRigType.R6))
	
	return roactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		Image = "rbxasset://textures/ui/InspectMenu/Button_outline.png",
		AnchorPoint = Vector2.new(0.5, 0),
		Size = UDim2.new(0.5, -32, 0, 44),
		Visible = showTryOn,
		ImageTransparency = if var1 then 0.5 else 0,
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
			TextTransparency = if var1 then 0.5 else 0,
			SelectionImageObject = p1.selectedImage,
			ZIndex = 2,
			[roactModule.Event.SelectionGained] = function(p2)
				-- upvalues: colorsModule (copy)
				p2.Parent.SelectionGainedImage.Visible = true
				p2.TextColor3 = colorsModule.Carbon
			end,
			[roactModule.Event.SelectionLost] = function(p2)
				-- upvalues: colorsModule (copy)
				p2.Parent.SelectionGainedImage.Visible = false
				p2.TextColor3 = colorsModule.White
			end,
			[roactModule.Ref] = p1.props.tryOnButtonRef,
			[roactModule.Event.Activated] = function()
				-- upvalues: p1 (ref)
				p1:activateButton()
			end
		})
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p1, _)
	return {
		locale = p1.locale,
		view = p1.view,
		assetInfo = p1.assets[p1.detailsInformation.assetId],
		bundleInfo = p1.bundles,
		tryingOnInfo = p1.tryingOnInfo
	}
end, function(p1)
	-- upvalues: tryOnItemModule (ref), setTryingOnInfoModule (ref)
	return {
		tryOnItem = function(p2, p3, p4, p5, p6)
			-- upvalues: p1 (ref), tryOnItemModule (copy)
			p1(tryOnItemModule(p2, p3, p4, p5, p6))
		end,
		takeOffItem = function()
			-- upvalues: p1 (ref), setTryingOnInfoModule (copy)
			p1(setTryingOnInfoModule(false, nil, nil))
		end
	}
end)(tryOnButton)
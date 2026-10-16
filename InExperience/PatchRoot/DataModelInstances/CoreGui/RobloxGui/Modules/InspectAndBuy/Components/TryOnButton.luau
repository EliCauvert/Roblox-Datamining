local CorePackages = game:GetService("CorePackages")
local ContextActionService = game:GetService("ContextActionService")
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local Parent = script.Parent.Parent
local ColorsModule = require(Parent.Colors)
local ConstantsModule = require(Parent.Constants)
local SetTryingOnInfoModule = require(Parent.Actions.SetTryingOnInfo)
local TryOnItemModule = require(Parent.Thunks.TryOnItem)
local GetSelectionImageObjectRoundedModule = require(Parent.getSelectionImageObjectRounded)
local TryOn = require(script.Parent.Common.ControllerShortcutKeycodes).TryOn
local TryOnButton = RoactModule.PureComponent:extend("TryOnButton")

function TryOnButton.init(p1) --[[ Line: 22 ]]
	-- upvalues: GetSelectionImageObjectRoundedModule (copy), ContextActionService (copy), TryOn (copy)
	p1.selectedImage = GetSelectionImageObjectRoundedModule()
	ContextActionService:BindCoreAction("TryOnGamepadShortcut", function(_, UserInputState, _) --[[ Line: 25 ]]
		-- upvalues: p1 (copy)
		if UserInputState == Enum.UserInputState.End then
			p1:activateButton()
			
			return Enum.ContextActionResult.Sink
		else
			return Enum.ContextActionResult.Pass
		end
	end, false, TryOn)
end

function TryOnButton.activateButton(p1) --[[ Line: 34 ]]
	-- upvalues: ConstantsModule (copy)
	if not p1.props.showTryOn then return end
	local AssetInfo = p1.props.assetInfo
	local TryOnItemFunction: (any, any, any, any, any) -> () = p1.props.tryOnItem
	local TakeOffItemFunction: () -> () = p1.props.takeOffItem
	local TryingOn = p1.props.tryingOnInfo.tryingOn
	local PartOfBundleAndOffsale = p1.props.partOfBundleAndOffsale
	local BundleId = p1.props.bundleId
	
	if not AssetInfo or (not p1.props.localPlayerModel or (ConstantsModule.LayeredAssetTypes[AssetInfo.assetTypeId] == nil or p1.props.localPlayerModel.Humanoid.RigType ~= Enum.HumanoidRigType.R6)) then
		if TryingOn then
			TakeOffItemFunction()
			
			return
		end
		TryOnItemFunction(true, AssetInfo.assetId, AssetInfo.assetTypeId, PartOfBundleAndOffsale, BundleId)
	end
end

function TryOnButton:willUnmount() --[[ Line: 61 ]]
	-- upvalues: ContextActionService (copy)
	ContextActionService:UnbindCoreAction("TryOnGamepadShortcut")
end

function TryOnButton.render(p1) --[[ Line: 65 ]]
	-- upvalues: ConstantsModule (copy), RoactModule (copy), ColorsModule (copy), RobloxTranslatorModule (copy), AppFonts (copy)
	local AssetInfo = p1.props.assetInfo
	local IsRigTypeMatch: boolean = AssetInfo and (p1.props.localPlayerModel and (ConstantsModule.LayeredAssetTypes[AssetInfo.assetTypeId] ~= nil and p1.props.localPlayerModel.Humanoid.RigType == Enum.HumanoidRigType.R6))
	
	return RoactModule.createElement("ImageLabel", {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		Image = "rbxasset://textures/ui/InspectMenu/Button_outline.png",
		AnchorPoint = Vector2.new(0.5, 0),
		Size = UDim2.new(0.5, -32, 0, 44),
		Visible = p1.props.showTryOn,
		ImageTransparency = if IsRigTypeMatch then 0.5 else 0,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(5, 5, 120, 20)
	}, {
		SelectionGainedImage = RoactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			Visible = false,
			Image = "rbxasset://textures/ui/InspectMenu/Button_white.png",
			Size = UDim2.new(1, 0, 1, 0),
			ImageColor3 = ColorsModule.Pumice
		}),
		TryOnTextKey = RoactModule.createElement("TextButton", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Text = RobloxTranslatorModule:FormatByKeyForLocale(if p1.props.tryingOnInfo.tryingOn then "InGame.InspectMenu.Action.TakeOff" else "InGame.InspectMenu.Action.TryOn", p1.props.locale),
			Font = AppFonts.default:getDefault(),
			TextSize = 16,
			TextColor3 = ColorsModule.White,
			TextTransparency = if IsRigTypeMatch then 0.5 else 0,
			SelectionImageObject = p1.selectedImage,
			ZIndex = 2,
			[RoactModule.Event.SelectionGained] = function(Label) --[[ Line: 114 ]]
				-- upvalues: ColorsModule (upval)
				Label.Parent.SelectionGainedImage.Visible = true
				Label.TextColor3 = ColorsModule.Carbon
			end,
			[RoactModule.Event.SelectionLost] = function(Label) --[[ Line: 118 ]]
				-- upvalues: ColorsModule (upval)
				Label.Parent.SelectionGainedImage.Visible = false
				Label.TextColor3 = ColorsModule.White
			end,
			[RoactModule.Ref] = p1.props.tryOnButtonRef,
			[RoactModule.Event.Activated] = function() --[[ Line: 123 ]]
				-- upvalues: p1 (copy)
				p1:activateButton()
			end
		})
	})
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1, _) --[[ Line: 130 ]]
	return {
		locale = p1.locale,
		view = p1.view,
		assetInfo = p1.assets[p1.detailsInformation.assetId],
		bundleInfo = p1.bundles,
		tryingOnInfo = p1.tryingOnInfo
	}
end, function(Callback) --[[ Line: 140 ]]
	-- upvalues: TryOnItemModule (copy), SetTryingOnInfoModule (copy)
	return {
		tryOnItem = function(p1, p2, p3, p4, p5) --[[ Line: 142 ]]
			-- upvalues: Callback (copy), TryOnItemModule (upval)
			Callback(TryOnItemModule(p1, p2, p3, p4, p5))
		end,
		takeOffItem = function() --[[ Line: 145 ]]
			-- upvalues: Callback (copy), SetTryingOnInfoModule (upval)
			Callback(SetTryingOnInfoModule(false, nil, nil))
		end
	}
end)(TryOnButton)
local Parent = script:FindFirstAncestor("CommunityLinks").Parent
local ReactModule = require(Parent.React)
local DashModule = require(Parent.Dash)
local UIBloxModule = require(Parent.UIBlox)
local _ = require(script.Parent.Parent.Models.CommunityInfo)
local GetCommunityUrlModule = require(script.Parent.Parent.Utils.getCommunityUrl)
local GetCommunityInviteUrlModule = require(script.Parent.Parent.Requests.GetCommunityInviteUrl)
local GuildedLogoAsset2x = require(script.Parent.Parent.constants).GuildedLogoAsset2x
local ConstantsModule = require(script.Parent.Parent.Analytics.constants)
local ClickCommunityLinkEventFunction = require(script.Parent.Parent.Analytics).Events.clickCommunityLinkEvent
local AppLinking = require(Parent.RoactServiceTags).AppLinking
local AppEventIngestService = require(Parent.RoactServiceTags).AppEventIngestService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local Interactable = UIBloxModule.Core.Control.Interactable
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local GetFFlagLuaAppFixCommunityLinksRedirectModule = require(script.Parent.Parent.Flags.GetFFlagLuaAppFixCommunityLinksRedirect)

return function(p1)
	-- upvalues: UseRoactServiceFunction (copy), AppLinking (copy), AppEventIngestService (copy), RoactNetworking (copy), UseStyleFunction (copy), UseLocalizationFunction (copy), UseDispatchFunction (copy), ReactModule (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), GetFFlagLuaAppFixCommunityLinksRedirectModule (copy), GetCommunityInviteUrlModule (copy), GetCommunityUrlModule (copy), ClickCommunityLinkEventFunction (copy), ConstantsModule (copy), Interactable (copy), DashModule (copy), GuildedLogoAsset2x (copy), StyledTextLabel (copy), Button (copy), ButtonType (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(AppLinking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppEventIngestService)
	local UseRoactServiceResult2 = UseRoactServiceFunction(RoactNetworking)
	local UseStyleResult = UseStyleFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		ViewLabel = "Feature.CommunityLinks.Label.ViewButton",
		DescriptionCommunityDefault = "Feature.CommunityLinks.Description.CommunityDefault"
	})
	local UseDispatchResult = UseDispatchFunction()
	local UseResult = ReactModule.useCallback(function(ContinueFunc)
		-- upvalues: UseDispatchResult (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval)
		UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.LeaveRobloxAlert, { continueFunc = ContinueFunc }))
	end, { UseDispatchResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), SetCentralOverlayFunction (upval)
		UseDispatchResult(SetCentralOverlayFunction())
	end, { UseDispatchResult })
	local CommunityId = p1.communityInfo.communityId
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: GetFFlagLuaAppFixCommunityLinksRedirectModule (upval), GetCommunityInviteUrlModule (upval), UseRoactServiceResult2 (copy), CommunityId (copy), UseRoactServiceResult (copy), GetCommunityUrlModule (upval), UseResult1 (copy), ClickCommunityLinkEventFunction (upval), UseRoactServiceResult1 (copy), ConstantsModule (upval), p1 (copy)
		if GetFFlagLuaAppFixCommunityLinksRedirectModule() then
			GetCommunityInviteUrlModule(UseRoactServiceResult2, CommunityId):andThen(function(Result)
				-- upvalues: UseRoactServiceResult (upval)
				UseRoactServiceResult:openURL(Result.responseBody)
			end)
		else
			UseRoactServiceResult:openURL((GetCommunityUrlModule(CommunityId)))
		end
		UseResult1()
		ClickCommunityLinkEventFunction(UseRoactServiceResult1, ConstantsModule.Context.CommunityLinkBanner, {
			entityType = "universe",
			guildedServerId = CommunityId,
			entityId = p1.universeId
		})
	end, { CommunityId, UseRoactServiceResult })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseResult (copy), UseResult2 (copy)
		UseResult(UseResult2)
	end, { UseResult, UseResult2 })
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local XOffset: number = if UseStateResult then 64 else 72
	local NoUseStateResult = not UseStateResult
	
	return ReactModule.createElement(Interactable, {
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = UseStyleResult.Theme.BackgroundUIDefault.Color,
		BackgroundTransparency = UseStyleResult.Theme.BackgroundUIDefault.Transparency,
		ClipsDescendants = true,
		[ReactModule.Change.AbsoluteSize] = ReactModule.useCallback(function(Frame)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(Frame.AbsoluteSize.X < 600)
		end, {}),
		[ReactModule.Event.Activated] = UseResult3,
		onStateChanged = DashModule.noop,
		LayoutOrder = p1.layoutOrder
	}, {
		BorderRadius = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		Padding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 12),
			PaddingTop = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 12),
			PaddingBottom = UDim.new(0, 12)
		}),
		UIListLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			Padding = UDim.new(0, 16),
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		Icon = ReactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.fromOffset(XOffset, XOffset),
			Image = GuildedLogoAsset2x
		}, {
			BorderRadius = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
		}),
		Info = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, -(XOffset + 16 + (if NoUseStateResult then 136 else 0)), 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				Padding = UDim.new(0, 8),
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			Name = ReactModule.createElement(StyledTextLabel, {
				richText = true,
				fluidSizing = false,
				layoutOrder = 1,
				text = p1.communityInfo.name,
				size = UDim2.new(1, 0, 0, 18),
				textYAlignment = Enum.TextYAlignment.Top,
				textTruncate = Enum.TextTruncate.AtEnd,
				fontStyle = UseStyleResult.Font.Header2,
				colorStyle = UseStyleResult.Theme.TextEmphasis
			}),
			Description = ReactModule.createElement(StyledTextLabel, {
				lineHeight = 1.15,
				richText = false,
				fluidSizing = false,
				layoutOrder = 2,
				text = p1.communityInfo.description or UseLocalizationResult.DescriptionCommunityDefault:gsub("{experienceName}", p1.linkedEntityName),
				size = UDim2.new(1, 0, 0, 44),
				textYAlignment = Enum.TextYAlignment.Center,
				textTruncate = Enum.TextTruncate.AtEnd,
				fontStyle = UseStyleResult.Font.Body,
				colorStyle = UseStyleResult.Theme.TextDefault
			})
		}),
		ViewButton = if NoUseStateResult then ReactModule.createElement(Button, {
			layoutOrder = 3,
			buttonType = ButtonType.PrimarySystem,
			size = UDim2.fromOffset(120, 28),
			text = UseLocalizationResult.ViewLabel,
			onActivated = UseResult3
		}) else nil
	})
end
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local AvatarExperience = Modules.AvatarExperience
local _ = require(AvatarExperience.Common.Types)
local LookImageFrameModule = require(AvatarExperience.Catalog.Components.LookDetails.LookDetails.LookImageFrame)
local FitFrameVertical = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents.FitFrameVertical
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local Skeleton = require(CorePackages.Packages.Foundation).Skeleton
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local GetFFlagLooksAvatarPDPImageDimensionsModule = require(Modules.AvatarExperience.Flags.GetFFlagLooksAvatarPDPImageDimensions)

return function(p1)
	-- upvalues: UseStyleFunction (copy), FFlagRenameDeprecatedUIBloxTokens (copy), ReactModule (copy), FitFrameVertical (copy), LookImageFrameModule (copy), GetFFlagLooksAvatarPDPImageDimensionsModule (copy), Skeleton (copy)
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	
	local function _()
		-- upvalues: UseStyleResultFont (copy)
		return UseStyleResultFont.BaseSize * UseStyleResultFont.Header2.RelativeSize
	end
	
	local HeaderFont = UseStyleResultFont.Header2.Font
	local ScaledBaseSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Header2.RelativeSize
	local Name = p1.name
	local IsLoading = p1.isLoading
	
	return ReactModule.createElement(FitFrameVertical, {
		BackgroundTransparency = 1,
		LayoutOrder = 1,
		width = UDim.new(1, 0),
		contentPadding = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseStyleResult.Tokens.Size.Size_300 else UseStyleResult.Tokens.Global.Space_150),
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		VerticalAlignment = Enum.VerticalAlignment.Center
	}, {
		LookImageFrame = ReactModule.createElement(LookImageFrameModule, {
			width = if GetFFlagLooksAvatarPDPImageDimensionsModule() then nil else p1.width,
			lookId = p1.lookId,
			lookDetails = p1.lookDetails,
			renderViewport = p1.renderViewport
		}),
		LookNameContainer = if GetFFlagLooksAvatarPDPImageDimensionsModule() and (IsLoading or Name) then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, p1.innerPadding),
				PaddingRight = UDim.new(0, p1.innerPadding)
			}),
			LookName = if IsLoading then ReactModule.createElement(Skeleton, { Size = UDim2.new(1, 0, 0, ScaledBaseSize) }) else ReactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				Size = UDim2.new(0, 0, 0, 0),
				Text = Name,
				TextTruncate = Enum.TextTruncate.AtEnd,
				AutomaticSize = Enum.AutomaticSize.XY,
				Font = HeaderFont,
				TextSize = ScaledBaseSize,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextColor3 = Theme.TextEmphasis.Color
			})
		}) else nil,
		LookName = if GetFFlagLooksAvatarPDPImageDimensionsModule() then nil elseif IsLoading then ReactModule.createElement(Skeleton, {
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, ScaledBaseSize)
		}) elseif Name then ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			LayoutOrder = 2,
			Size = UDim2.new(0, 0, 0, 0),
			Text = Name,
			TextTruncate = Enum.TextTruncate.AtEnd,
			AutomaticSize = Enum.AutomaticSize.XY,
			Font = HeaderFont,
			TextSize = ScaledBaseSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextColor3 = Theme.TextEmphasis.Color
		}) or ReactModule.createElement(Skeleton, {
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, ScaledBaseSize)
		}) else nil
	})
end
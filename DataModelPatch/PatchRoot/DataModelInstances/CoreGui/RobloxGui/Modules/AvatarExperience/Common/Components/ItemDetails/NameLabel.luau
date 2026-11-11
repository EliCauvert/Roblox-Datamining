local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Skeleton = require(CorePackages.Packages.Foundation).Skeleton
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local IconSize = UIBloxModule.App.Constant.IconSize
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local RoactFitComponents = require(CorePackages.Packages.AvatarExperienceDeps).RoactFitComponents
local FitFrameVertical = RoactFitComponents.FitFrameVertical
local FitTextLabel = RoactFitComponents.FitTextLabel
local IconsStatusPremiumSmall = UIBloxModule.App.ImageSet.Images["icons/status/premium_small"]

return function(p1)
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), IconSize (copy), RoactModule (copy), FitFrameVertical (copy), IsVRAppBuildFunction (copy), FitTextLabel (copy), ImageSetLabel (copy), IconsStatusPremiumSmall (copy), Skeleton (copy)
	local UseStyleResult = UseStyleFunction()
	local Theme = UseStyleResult.Theme
	local UseStyleResultFont = UseStyleResult.Font
	local Binding, Binding2 = ReactModule.createBinding(false)
	
	local function _()
		-- upvalues: UseStyleResultFont (copy)
		return UseStyleResultFont.BaseSize * UseStyleResultFont.Header1.RelativeSize
	end
	
	local _ = function()
		-- upvalues: p1 (copy)
		return p1.name or ""
	end
	
	local Small = IconSize.Small
	local Name = p1.name or ""
	local HeaderFont = UseStyleResultFont.Header1.Font
	local ScaledBaseSize = UseStyleResultFont.BaseSize * UseStyleResultFont.Header1.RelativeSize
	local ShowPremiumBenefits = p1.showPremiumBenefits
	
	return RoactModule.createElement(FitFrameVertical, {
		width = UDim.new(1, 0),
		LayoutOrder = 0,
		BackgroundTransparency = 1,
		[RoactModule.Change.AbsolutePosition] = function(Frame)
			-- upvalues: p1 (copy), Binding2 (copy)
			if not p1.actionBarHeaderRef then return end
			local Current = p1.actionBarHeaderRef.current
			
			if Current then
				local IsYBelow = Frame.AbsolutePosition.Y < Current.AbsolutePosition.Y
				Current.Visible = not IsYBelow
				Binding2(IsYBelow)
				
				return
			end
		end
	}, {
		TextLabel = if IsVRAppBuildFunction() then nil elseif Name then RoactModule.createElement(FitTextLabel, {
			BackgroundTransparency = 1,
			TextWrapped = true,
			width = UDim.new(1, 0),
			Visible = Binding,
			Font = HeaderFont,
			Text = Name,
			TextSize = ScaledBaseSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextColor3 = Theme.TextEmphasis.Color
		}, {
			PremiumIcon = if ShowPremiumBenefits then RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				Position = UDim2.new(0, 0, 0, 5),
				Size = UDim2.new(0, Small, 0, Small),
				ScaleType = Enum.ScaleType.Fit,
				Image = IconsStatusPremiumSmall,
				ImageColor3 = Theme.IconEmphasis.Color,
				ImageTransparency = Theme.IconEmphasis.Transparency
			}) else nil
		}) else RoactModule.createElement(Skeleton, { Size = UDim2.new(1, 0, 0, ScaledBaseSize) }),
		RefUpdater = RoactModule.createElement("Frame", {
			Size = UDim2.new(0, 0, 0, 0),
			BackgroundTransparency = 1,
			[RoactModule.Ref] = function(p2)
				-- upvalues: p1 (copy), Binding2 (copy)
				if p2 and p2.Parent then
					local Parent = p2.Parent
					
					if not p1.actionBarHeaderRef then return end
					local Current = p1.actionBarHeaderRef.current
					
					if not Current then return end
					local IsYBelow = Parent.AbsolutePosition.Y < Current.AbsolutePosition.Y
					Current.Visible = not IsYBelow
					Binding2(IsYBelow)
				end
			end
		})
	})
end
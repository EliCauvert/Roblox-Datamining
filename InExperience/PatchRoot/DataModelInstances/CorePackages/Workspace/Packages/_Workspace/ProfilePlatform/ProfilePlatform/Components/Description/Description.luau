local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local textService = game:GetService("TextService")
local fFlagProfilePlatformNewProfileHeader = require(parent.SharedFlags).FFlagProfilePlatformNewProfileHeader
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local useDynamicSizeMarginModule = require(profilePlatform.Hooks.useDynamicSizeMargin)
local useAboutSectionHeightModule = require(profilePlatform.Hooks.useAboutSectionHeight)
local textKeysModule = require(profilePlatform.Common.TextKeys)
local enumsModule = require(profilePlatform.Common.Enums)
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local responsiveModule = require(parent.Responsive)
local useScreenSize = require(parent.RobloxAppHooks).useScreenSize
local useIsSpatial = responsiveModule.useIsSpatial
local usePreferredInput = responsiveModule.usePreferredInput
local useLocalization = localizationModule.Hooks.useLocalization
local horizontalPageMargin = UIBloxModule.App.Container.HorizontalPageMargin
local expandableTextArea = UIBloxModule.App.Text.ExpandableTextArea
local useTokens = foundationModule.Hooks.useTokens
local text = foundationModule.Text
local view = foundationModule.View

return function(p1)
	-- upvalues: useTokens (ref), useScreenSize (ref), useDynamicSizeMarginModule (ref), useProfileWrapperContextModule (ref), reactModule (ref), useLocalization (ref), textKeysModule (ref), useIsSpatial (ref), usePreferredInput (ref), responsiveModule (ref), useAboutSectionHeightModule (ref), fFlagProfilePlatformNewProfileHeader (ref), textService (ref), enumsModule (ref), view (ref), text (ref), horizontalPageMargin (ref), expandableTextArea (ref)
	local var1
	local var2 = useTokens()
	local var3 = useScreenSize()
	local var4, var5 = useDynamicSizeMarginModule()
	local var6 = useProfileWrapperContextModule()
	local bodyMedium = var2.Typography.BodyMedium
	local var7, var8 = reactModule.useState(var3.X)
	local profileType = var6.profileType
	local var9 = useLocalization({
		moreText = textKeysModule.More,
		noBioYet = textKeysModule.NoBioYet
	})
	local description = p1.description
	local var10 = useIsSpatial() or usePreferredInput() == responsiveModule.Input.Directional
	local var11, var12 = useAboutSectionHeightModule(description, var7, var4)
	local var13 = if fFlagProfilePlatformNewProfileHeader then var12 else reactModule.useMemo(function()
		-- upvalues: description (write), textService (copy), bodyMedium (ref), var10 (ref)
		return textService:GetTextSize(string.gsub(description or "", "[\r\n]+", " "), bodyMedium.FontSize, bodyMedium.Font, Vector2.new(1e999, 1e999)).Y * (if var10 then 2.6 else 2)
	end, { description, bodyMedium.FontSize, bodyMedium.Font, var10 })
	
	if fFlagProfilePlatformNewProfileHeader then
		var1 = var12 < var11
		var1 = nil
	else
		var1 = nil
	end
	local var14 = reactModule.useMemo(function()
		-- upvalues: var7 (ref), var4 (ref), reactModule (copy), var13 (ref)
		return reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(var7 - var4 * 2, var13) })
	end, { var13, var7, var4 })
	
	if description == nil or description == "" then
		if fFlagProfilePlatformNewProfileHeader then
			return nil
		end
		description = var9.noBioYet
	end
	return if profileType == enumsModule.ProfileTypes.User or profileType == enumsModule.ProfileTypes.Contact then reactModule.createElement("Frame", {
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		[reactModule.Change.AbsoluteSize] = function(p2)
			-- upvalues: var5 (ref), var8 (ref)
			var5(p2)
			var8(p2.AbsoluteSize.X)
		end
	}, {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, var4),
			PaddingRight = UDim.new(0, var4)
		}),
		DescriptionContainer = reactModule.createElement(view, { tag = "size-full col gap-xsmall" }, {
			Description = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-wrap text-align-x-left text-align-y-top text-truncate-split",
				Text = description,
				fontStyle = bodyMedium
			}, { UISizeConstraint = var14 }),
			MoreButton = if fFlagProfilePlatformNewProfileHeader then if var1 then reactModule.createElement(text, {
				LayoutOrder = 2,
				RichText = true,
				tag = "auto-xy text-wrap text-align-x-left text-align-y-top text-truncate-split",
				Text = `<u>{var9.moreText}</u>`,
				fontStyle = var2.Typography.TitleMedium,
				onActivated = p1.onActivateMoreButton
			}) else nil else reactModule.createElement(text, {
				LayoutOrder = 2,
				RichText = true,
				tag = "auto-xy text-wrap text-align-x-left text-align-y-top text-truncate-split",
				Text = `<u>{var9.moreText}</u>`,
				fontStyle = var2.Typography.TitleMedium,
				onActivated = p1.onActivateMoreButton
			})
		})
	}) else reactModule.createElement(horizontalPageMargin, {
		backgroundTransparency = 1,
		useAutomaticSizing = true,
		layoutOrder = p1.layoutOrder,
		size = UDim2.new(1, 0, 0, 0)
	}, {
		Description = reactModule.createElement(expandableTextArea, {
			compactNumberOfLines = 3,
			Text = p1.description,
			padding = Vector2.new(0, 0)
		})
	})
end
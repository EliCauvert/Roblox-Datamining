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

return function(p0) --[[ line: 38 | named "Description" ]]
	-- upvalues: useTokens (ref), useScreenSize (ref), useDynamicSizeMarginModule (ref), useProfileWrapperContextModule (ref), reactModule (ref), useLocalization (ref), textKeysModule (ref), useIsSpatial (ref), usePreferredInput (ref), responsiveModule (ref), useAboutSectionHeightModule (ref), fFlagProfilePlatformNewProfileHeader (ref), textService (ref), enumsModule (ref), view (ref), text (ref), horizontalPageMargin (ref), expandableTextArea (ref)
	local var24
	local var12 = useTokens()
	local var13 = useScreenSize()
	local var14, var15 = useDynamicSizeMarginModule()
	local var16 = useProfileWrapperContextModule()
	local bodyMedium = var12.Typography.BodyMedium
	local var17, var18 = reactModule.useState(var13.X)
	local profileType = var16.profileType
	local var19 = useLocalization({
		moreText = textKeysModule.More,
		noBioYet = textKeysModule.NoBioYet
	})
	local description = p0.description
	local var20 = useIsSpatial() or usePreferredInput() == responsiveModule.Input.Directional
	local var21, var22 = useAboutSectionHeightModule(description, var17, var14)
	local var23 = if fFlagProfilePlatformNewProfileHeader then var22 else reactModule.useMemo(function() --[[ line: 58 ]]
		-- upvalues: description (write), textService (copy), bodyMedium (ref), var20 (ref)
		return textService:GetTextSize(string.gsub(description or "", "[\r\n]+", " "), bodyMedium.FontSize, bodyMedium.Font, Vector2.new(1e999, 1e999)).Y * (if var20 then 2.6 else 2)
	end, { description, bodyMedium.FontSize, bodyMedium.Font, var20 })
	
	if fFlagProfilePlatformNewProfileHeader then
		var24 = var22 < var21
		var24 = nil
	else
		var24 = nil
	end
	local var25 = reactModule.useMemo(function() --[[ line: 74 ]]
		-- upvalues: var17 (ref), var14 (ref), reactModule (copy), var23 (ref)
		return reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(var17 - var14 * 2, var23) })
	end, { var23, var17, var14 })
	
	if description == nil or description == "" then
		if fFlagProfilePlatformNewProfileHeader then
			return nil
		end
		description = var19.noBioYet
	end
	return if profileType == enumsModule.ProfileTypes.User or profileType == enumsModule.ProfileTypes.Contact then reactModule.createElement("Frame", {
		LayoutOrder = p0.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.Y,
		[reactModule.Change.AbsoluteSize] = function(p1) --[[ line: 95 ]]
			-- upvalues: var15 (ref), var18 (ref)
			var15(p1)
			var18(p1.AbsoluteSize.X)
		end
	}, {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, var14),
			PaddingRight = UDim.new(0, var14)
		}),
		DescriptionContainer = reactModule.createElement(view, { tag = "size-full col gap-xsmall" }, {
			Description = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-wrap text-align-x-left text-align-y-top text-truncate-split",
				Text = description,
				fontStyle = bodyMedium
			}, { UISizeConstraint = var25 }),
			MoreButton = if fFlagProfilePlatformNewProfileHeader then if var24 then reactModule.createElement(text, {
				LayoutOrder = 2,
				RichText = true,
				tag = "auto-xy text-wrap text-align-x-left text-align-y-top text-truncate-split",
				Text = `<u>{var19.moreText}</u>`,
				fontStyle = var12.Typography.TitleMedium,
				onActivated = p0.onActivateMoreButton
			}) else nil else reactModule.createElement(text, {
				LayoutOrder = 2,
				RichText = true,
				tag = "auto-xy text-wrap text-align-x-left text-align-y-top text-truncate-split",
				Text = `<u>{var19.moreText}</u>`,
				fontStyle = var12.Typography.TitleMedium,
				onActivated = p0.onActivateMoreButton
			})
		})
	}) else reactModule.createElement(horizontalPageMargin, {
		backgroundTransparency = 1,
		useAutomaticSizing = true,
		layoutOrder = p0.layoutOrder,
		size = UDim2.new(1, 0, 0, 0)
	}, {
		Description = reactModule.createElement(expandableTextArea, {
			compactNumberOfLines = 3,
			Text = p0.description,
			padding = Vector2.new(0, 0)
		})
	})
end
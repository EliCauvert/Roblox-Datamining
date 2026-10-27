local Reactions = script:FindFirstAncestor("Reactions")
local Parent = Reactions.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ReactionModule = require(Reactions.Components.Reaction)
local _ = require(Reactions.Enums.ReactionType)
local AbbreviateReactionCountModule = require(Reactions.Utils.abbreviateReactionCount)
local GetTopReactionsModule = require(Reactions.Utils.getTopReactions)
local Image = FoundationModule.Image
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local GetRbxThumbFunction = FoundationModule.Utility.getRbxThumb
local ThumbnailSize = FoundationModule.Enums.ThumbnailSize
local ThumbnailType = FoundationModule.Enums.ThumbnailType

return function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), GetTopReactionsModule (copy), ReactionModule (copy), Image (copy), GetRbxThumbFunction (copy), ThumbnailType (copy), ThumbnailSize (copy), AbbreviateReactionCountModule (copy), Text (copy), View (copy)
	local UseTokensResult = UseTokensFunction()
	local TestId = p1.testId or "reaction-chip"
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetTopReactionsModule (upval), p1 (copy)
		return GetTopReactionsModule(p1.reactionCounts, 3)
	end, { p1.reactionCounts })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseTokensResult (copy)
		return {
			radius = UDim.new(0, UseTokensResult.Radius.Circle),
			offset = UseTokensResult.Size.Size_150,
			borderWidth = UseTokensResult.Stroke.Thicker
		}
	end, { UseTokensResult })
	
	if UseMemoResult.totalCount <= 0 then
		return nil
	end
	local _UDim2 = UDim2.fromOffset(UseTokensResult.Size.Size_400, UseTokensResult.Size.Size_400)
	local v1: boolean = p1.userIds ~= nil and #p1.userIds > 0
	local Elements = {}
	
	for LayoutOrder, reaction in UseMemoResult.reactions do
		Elements[reaction] = ReactModule.createElement(ReactionModule, {
			reactionType = reaction,
			Size = _UDim2,
			LayoutOrder = LayoutOrder,
			testId = `{TestId}--reaction`
		})
	end
	if v1 then
		local UserIds = p1.userIds
		
		for i = 1, math.min(2, #UserIds) do
			Elements[`Avatar{i}`] = ReactModule.createElement(Image, {
				tag = "size-400-400 radius-circle bg-shift-300",
				Image = GetRbxThumbFunction(ThumbnailType.AvatarHeadShot, UserIds[i], ThumbnailSize.Small),
				LayoutOrder = i + 3,
				testId = `{TestId}--avatar`
			})
		end
	elseif UseMemoResult.totalCount > 1 then
		Elements.Count = ReactModule.createElement(Text, {
			tag = "auto-xy text-label-medium content-emphasis",
			LayoutOrder = 4,
			Text = (p1.localizeCount or AbbreviateReactionCountModule)(UseMemoResult.totalCount),
			testId = `{TestId}--count`
		})
	end
	return ReactModule.createElement(View, {
		tag = "size-0-800 auto-x padding-xxsmall radius-circle",
		backgroundStyle = p1.borderStyle or UseTokensResult.Color.Surface.Surface_0,
		LayoutOrder = p1.layoutOrder
	}, {
		Chip = ReactModule.createElement(View, {
			tag = "row align-y-center gap-xsmall size-0-full auto-x padding-x-small radius-circle bg-surface-300",
			onActivated = p1.onActivated,
			cursor = if p1.onActivated then UseMemoResult1 else nil,
			testId = TestId
		}, Elements)
	})
end
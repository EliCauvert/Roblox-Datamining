local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local FoundationModule = require(Parent1.Foundation)
local ReactModule = require(Parent1.React)
local ReactCTAModule = require(Parent.Components.Reactions.ReactCTA)
local ReactionIconMappings = require(Parent.Constants).ReactionIconMappings
local ReactionPickerModule = require(Parent.Components.Reactions.ReactionPicker)
local Popover = FoundationModule.Popover
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide
local GetDeepValueFunction = require(Parent1.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local UseSelectorFunction = require(Parent1.RoactUtils).Hooks.RoactRodux.useSelector

return function(p1)
	-- upvalues: UseSelectorFunction (copy), GetDeepValueFunction (copy), ReactModule (copy), Popover (copy), ReactCTAModule (copy), ReactionIconMappings (copy), PopoverSide (copy), PopoverAlign (copy), ReactionPickerModule (copy)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: GetDeepValueFunction (upval), p1 (copy)
		local DeepValue = GetDeepValueFunction(p2, "ContentSharing.byUserId." .. p1.creatorUserId .. ".reactionsByPostId")
		
		return if DeepValue and DeepValue[p1.postId] then DeepValue[p1.postId].viewerUserReactedToEmoteId else nil
	end)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	
	return ReactModule.createElement(Popover.Root, { LayoutOrder = p1.layoutOrder, isOpen = UseStateResult }, {
		Anchor = ReactModule.createElement(Popover.Anchor, {}, {
			ReactCTA = ReactModule.createElement(ReactCTAModule, {
				onShortPress = ReactModule.useCallback(function() end, {}),
				onLongPress = function()
					-- upvalues: UseStateResult2 (copy)
					UseStateResult2(true)
				end,
				activeReaction = if UseSelectorResult then ReactionIconMappings[UseSelectorResult] else nil
			})
		}),
		Content = ReactModule.createElement(Popover.Content, {
			hasArrow = false,
			side = { offset = 20, position = PopoverSide.Top },
			align = PopoverAlign.End,
			onPressedOutside = function()
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(false)
			end
		}, {
			ReactionPicker = ReactModule.createElement(ReactionPickerModule, {
				reactToContent = ReactModule.useCallback(function(_)
					-- upvalues: UseStateResult2 (copy)
					UseStateResult2(false)
				end, { UseStateResult2 })
			})
		})
	})
end
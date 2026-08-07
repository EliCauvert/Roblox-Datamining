local groups = script:FindFirstAncestor("Groups")
local parent = groups.Parent
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useNavigation = require(parent.Navigation).useNavigation
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local appHeaderBarModule = require(parent.AppHeaderBar)
local textKeysModule = require(groups.Common.TextKeys)
local useGroupsWrapperContextModule = require(groups.Contexts.useGroupsWrapperContext)

return function(p0) --[[ line: 33 | named "GroupsListHeader" ]]
	-- upvalues: useGroupsWrapperContextModule (ref), useNavigation (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), appHeaderBarModule (ref), view (ref), text (ref), button (ref), buttonVariant (ref), inputSize (ref)
	local var6 = useGroupsWrapperContextModule()
	local var7 = useNavigation()
	local var8 = useLocalization({
		title = textKeysModule.HeadingGroups,
		seeAll = textKeysModule.ActionSeeAll
	})
	local var9 = reactModule.useCallback(function() --[[ line: 42 ]]
		-- upvalues: var7 (ref)
		var7.goBack()
	end, { var7 })
	local var10 = reactModule.useMemo(function() --[[ line: 46 ]]
		-- upvalues: appHeaderBarModule (copy), var9 (ref)
		return appHeaderBarModule.makeBackButton(var9)
	end, { var9 })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p0.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		LeftSection = reactModule.createElement(view, { tag = "row auto-xy align-y-center gap-small" }, {
			BackButton = reactModule.useMemo(function() --[[ line: 50 ]]
				-- upvalues: var10 (ref), reactModule (copy), view (copy)
				return reactModule.createElement(view, { tag = "size-0 auto-xy align-x-left", LayoutOrder = 1 }, { button = var10() })
			end, { var10 }),
			Title = reactModule.createElement(text, {
				tag = "text-align-x-left content-default text-heading-medium",
				LayoutOrder = 2,
				Text = var8.title
			})
		}),
		SeeAllButton = reactModule.createElement(button, {
			text = var8.seeAll,
			variant = buttonVariant.Text,
			size = inputSize.Medium,
			onActivated = var6.navigateTo.seeAllGroups,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, 0, 0.5, 0)
		})
	})
end
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

return function(p1)
	-- upvalues: useGroupsWrapperContextModule (ref), useNavigation (ref), useLocalization (ref), textKeysModule (ref), reactModule (ref), appHeaderBarModule (ref), view (ref), text (ref), button (ref), buttonVariant (ref), inputSize (ref)
	local var1 = useGroupsWrapperContextModule()
	local var2 = useNavigation()
	local var3 = useLocalization({
		title = textKeysModule.HeadingGroups,
		seeAll = textKeysModule.ActionSeeAll
	})
	local var4 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		var2.goBack()
	end, { var2 })
	local var5 = reactModule.useMemo(function()
		-- upvalues: appHeaderBarModule (copy), var4 (ref)
		return appHeaderBarModule.makeBackButton(var4)
	end, { var4 })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		LeftSection = reactModule.createElement(view, { tag = "row auto-xy align-y-center gap-small" }, {
			BackButton = reactModule.useMemo(function()
				-- upvalues: var5 (ref), reactModule (copy), view (copy)
				return reactModule.createElement(view, { tag = "size-0 auto-xy align-x-left", LayoutOrder = 1 }, { button = var5() })
			end, { var5 }),
			Title = reactModule.createElement(text, {
				tag = "text-align-x-left content-default text-heading-medium",
				LayoutOrder = 2,
				Text = var3.title
			})
		}),
		SeeAllButton = reactModule.createElement(button, {
			text = var3.seeAll,
			variant = buttonVariant.Text,
			size = inputSize.Medium,
			onActivated = var1.navigateTo.seeAllGroups,
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, 0, 0.5, 0)
		})
	})
end
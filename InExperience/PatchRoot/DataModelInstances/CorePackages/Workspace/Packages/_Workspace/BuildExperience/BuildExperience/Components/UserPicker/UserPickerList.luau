local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local userPickerRowModule = require(script.Parent.UserPickerRow)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local list = foundationModule.List
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local view = foundationModule.View
local inputSize = foundationModule.Enums.InputSize
local radius = foundationModule.Enums.Radius

local function _(p1)
	return string.gsub(p1, "^%s*(.-)%s*$", "%1")
end

local function renderSkeletonRow(p1, p2)
	-- upvalues: reactModule (ref), view (ref), skeleton (ref), radius (ref)
	return reactModule.createElement(view, {
		tag = "row align-y-center gap-medium size-full-0 auto-y padding-y-small",
		LayoutOrder = p1,
		testId = p2
	}, {
		Avatar = reactModule.createElement(skeleton, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(36, 36),
			radius = radius.Circle
		}),
		Lines = reactModule.createElement(view, { LayoutOrder = 2, tag = "col fill gap-small auto-y" }, {
			Title = reactModule.createElement(skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(0.5, 0, 0, 12),
				radius = radius.Small
			}),
			Description = reactModule.createElement(skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(0.3, 0, 0, 10),
				radius = radius.Small
			})
		})
	})
end

return function(p1)
	-- upvalues: useLocalization (ref), localizationStringsModule (ref), renderSkeletonRow (ref), reactModule (ref), view (ref), text (ref), userPickerRowModule (ref), list (ref), inputSize (ref)
	local noResults = useLocalization({
		noResults = localizationStringsModule.USER_PICKER_NO_RESULTS
	}).noResults
	local testId = p1.testId or "user-picker-list"
	local userIds = p1.userIds
	
	if #userIds == 0 and p1.isLoading then
		local t = {}
		
		for i = 1, 6 do
			t[`skeleton-{i}`] = renderSkeletonRow(i, `{testId}-skeleton-{i}`)
		end
		return reactModule.createElement(view, {
			tag = "col gap-small size-full-0 auto-y",
			LayoutOrder = p1.layoutOrder,
			testId = `{testId}-loading`
		}, t)
	elseif #userIds == 0 and not p1.isLoading then
		local var1 = if string.gsub(p1.searchText, "^%s*(.-)%s*$", "%1") ~= "" then p1.emptyText else noResults
		
		if var1 ~= nil then
			return reactModule.createElement(view, {
				tag = "col align-x-center size-full-0 auto-y padding-y-xlarge",
				LayoutOrder = p1.layoutOrder,
				testId = `{testId}-empty`
			}, {
				Text = reactModule.createElement(text, {
					tag = "auto-xy text-body-large text-align-x-center content-muted",
					Text = var1
				})
			})
		end
	end
	local t = {}
	
	for i_1, v in userIds do
		t[`row-{v}`] = reactModule.createElement(userPickerRowModule, {
			userId = v,
			isSelected = p1.isSelected(v),
			isDisabled = not p1.canSelect(v),
			onToggle = function()
				-- upvalues: p1 (ref), v (ref)
				p1.toggleSelected(v)
			end,
			layoutOrder = i_1,
			testId = `{testId}-user-{v}`
		})
	end
	return reactModule.createElement(list.Root, {
		hasDivider = false,
		isContained = false,
		LayoutOrder = p1.layoutOrder,
		size = inputSize.Medium,
		testId = `{testId}-results`
	}, t)
end
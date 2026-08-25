local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local userPickerRowModule = require(script.Parent.UserPickerRow)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local list = foundationModule.List
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local view = foundationModule.View
local inputSize = foundationModule.Enums.InputSize
local radius = foundationModule.Enums.Radius
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization

local function _(p0)
	return string.gsub(p0, "^%s*(.-)%s*$", "%1")
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

return function(p3)
	-- upvalues: fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), renderSkeletonRow (ref), reactModule (ref), view (ref), text (ref), userPickerRowModule (ref), list (ref), inputSize (ref)
	local var7 = if fFlagBuildLocalization then (if fFlagBuildLocalization then useLocalization({
		noResults = localizationStringsModule.USER_PICKER_NO_RESULTS
	}) else nil).noResults else localizationStringsModule.USER_PICKER_NO_RESULTS
	local testId = p3.testId or "user-picker-list"
	local userIds = p3.userIds
	
	if #userIds == 0 and p3.isLoading then
		local t = {}
		
		for i = 1, 6 do
			t[`skeleton-{i}`] = renderSkeletonRow(i, `{testId}-skeleton-{i}`)
		end
		return reactModule.createElement(view, {
			tag = "col gap-small size-full-0 auto-y",
			LayoutOrder = p3.layoutOrder,
			testId = `{testId}-loading`
		}, t)
	elseif #userIds == 0 and not p3.isLoading then
		local var10 = if string.gsub(p3.searchText, "^%s*(.-)%s*$", "%1") ~= "" then p3.emptyText else var7
		
		if var10 ~= nil then
			return reactModule.createElement(view, {
				tag = "col align-x-center size-full-0 auto-y padding-y-xlarge",
				LayoutOrder = p3.layoutOrder,
				testId = `{testId}-empty`
			}, {
				Text = reactModule.createElement(text, {
					tag = "auto-xy text-body-large text-align-x-center content-muted",
					Text = var10
				})
			})
		end
	end
	local t = {}
	
	for i_1, v in userIds do
		t[`row-{v}`] = reactModule.createElement(userPickerRowModule, {
			userId = v,
			isSelected = p3.isSelected(v),
			isDisabled = not p3.canSelect(v),
			onToggle = function()
				-- upvalues: p3 (ref), v (ref)
				p3.toggleSelected(v)
			end,
			layoutOrder = i_1,
			testId = `{testId}-user-{v}`
		})
	end
	return reactModule.createElement(list.Root, {
		hasDivider = false,
		isContained = false,
		LayoutOrder = p3.layoutOrder,
		size = inputSize.Medium,
		testId = `{testId}-results`
	}, t)
end
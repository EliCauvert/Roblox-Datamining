local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UserPickerRowModule = require(script.Parent.UserPickerRow)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local List = FoundationModule.List
local Skeleton = FoundationModule.Skeleton
local Text = FoundationModule.Text
local View = FoundationModule.View
local InputSize = FoundationModule.Enums.InputSize
local Radius = FoundationModule.Enums.Radius

local function _(Text: string): string --[[ Line: 41 | Named "trim" ]]
	return (string.gsub(Text, "^%s*(.-)%s*$", "%1"))
end

local function renderSkeletonRow(LayoutOrder, TestId) --[[ Line: 47 ]]
	-- upvalues: ReactModule (copy), View (copy), Skeleton (copy), Radius (copy)
	return ReactModule.createElement(View, {
		tag = "row align-y-center gap-medium size-full-0 auto-y padding-y-small",
		LayoutOrder = LayoutOrder,
		testId = TestId
	}, {
		Avatar = ReactModule.createElement(Skeleton, {
			LayoutOrder = 1,
			Size = UDim2.fromOffset(36, 36),
			radius = Radius.Circle
		}),
		Lines = ReactModule.createElement(View, { LayoutOrder = 2, tag = "col fill gap-small auto-y" }, {
			Title = ReactModule.createElement(Skeleton, {
				LayoutOrder = 1,
				Size = UDim2.new(0.5, 0, 0, 12),
				radius = Radius.Small
			}),
			Description = ReactModule.createElement(Skeleton, {
				LayoutOrder = 2,
				Size = UDim2.new(0.3, 0, 0, 10),
				radius = Radius.Small
			})
		})
	})
end

return function(p1) --[[ Line: 76 | Named "UserPickerList" ]]
	-- upvalues: UseLocalizationFunction (copy), LocalizationStringsModule (copy), renderSkeletonRow (copy), ReactModule (copy), View (copy), Text (copy), UserPickerRowModule (copy), List (copy), InputSize (copy)
	local NoResults = UseLocalizationFunction({
		noResults = LocalizationStringsModule.USER_PICKER_NO_RESULTS
	}).noResults
	local TestId = p1.testId or "user-picker-list"
	local UserIds = p1.userIds
	
	if #UserIds == 0 and p1.isLoading then
		local t = {}
		
		for i = 1, 6 do
			t[`skeleton-{i}`] = renderSkeletonRow(i, `{TestId}-skeleton-{i}`)
		end
		return ReactModule.createElement(View, {
			tag = "col gap-small size-full-0 auto-y",
			LayoutOrder = p1.layoutOrder,
			testId = `{TestId}-loading`
		}, t)
	else
		if #UserIds == 0 and not p1.isLoading then
			local EmptyText = if string.gsub(p1.searchText, "^%s*(.-)%s*$", "%1") == "" then p1.emptyText else NoResults
			
			if EmptyText ~= nil then
				return ReactModule.createElement(View, {
					tag = "col align-x-center size-full-0 auto-y padding-y-xlarge",
					LayoutOrder = p1.layoutOrder,
					testId = `{TestId}-empty`
				}, {
					Text = ReactModule.createElement(Text, {
						tag = "auto-xy text-body-large text-align-x-center content-muted",
						Text = EmptyText
					})
				})
			end
		end
		local Elements = {}
		
		for LayoutOrder, userId in UserIds do
			Elements[`row-{userId}`] = ReactModule.createElement(UserPickerRowModule, {
				userId = userId,
				isSelected = p1.isSelected(userId),
				isDisabled = not p1.canSelect(userId),
				onToggle = function() --[[ Line: 121 ]]
					-- upvalues: p1 (copy), userId (copy)
					p1.toggleSelected(userId)
				end,
				layoutOrder = LayoutOrder,
				testId = `{TestId}-user-{userId}`
			})
		end
		return ReactModule.createElement(List.Root, {
			hasDivider = false,
			isContained = false,
			LayoutOrder = p1.layoutOrder,
			size = InputSize.Medium,
			testId = `{TestId}-results`
		}, Elements)
	end
end
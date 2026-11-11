local Schools = script:FindFirstAncestor("Schools")
local Parent = Schools.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TextKeysModule = require(Schools.Common.TextKeys)
local SchoolMembersMockModule = require(Schools.Common.SchoolMembersMock)
local SchoolsPageModule = require(Schools.Components.Common.SchoolsPage)
local FilterChipModule = require(script.Parent.FilterChip)
local View = FoundationModule.View
local Text = FoundationModule.Text
local VerticalUserList = require(Parent.UserList).VerticalUserList.VerticalUserList
local Configs = { showSubtitle = true, showPresence = true }

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), SchoolMembersMockModule (copy), SchoolsPageModule (copy), Text (copy), View (copy), FilterChipModule (copy), VerticalUserList (copy), Configs (copy)
	local ClassYears = p1.classYears
	local UseLocalizationResult = UseLocalizationFunction({
		pageTitle = TextKeysModule.PageTitle,
		membersWithCount = { TextKeysModule.MembersWithCount, count = p1.memberCount },
		apply = TextKeysModule.FilterApply,
		gradYear = TextKeysModule.FilterGradYear,
		allYears = TextKeysModule.FilterAllYears
	})
	
	return ReactModule.createElement(SchoolsPageModule, {
		maxContentWidth = 600,
		fillContent = true,
		title = UseLocalizationResult.pageTitle,
		onBack = p1.onBack
	}, {
		Heading = ReactModule.createElement(Text, {
			tag = "size-full-0 auto-y text-heading-medium text-align-x-left content-default",
			LayoutOrder = 1,
			Text = p1.schoolName
		}),
		Body = ReactModule.createElement(Text, {
			tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
			LayoutOrder = 2,
			Text = p1.location
		}),
		SectionTitle = ReactModule.createElement(Text, {
			tag = "size-full-0 auto-y text-title-large text-align-x-left content-emphasis",
			LayoutOrder = 3,
			Text = UseLocalizationResult.membersWithCount
		}),
		Filters = ReactModule.createElement(View, {
			tag = "row align-y-center gap-small size-full-0 auto-y",
			LayoutOrder = 4
		}, {
			GradYear = ReactModule.createElement(FilterChipModule, {
				layoutOrder = 1,
				label = UseLocalizationResult.gradYear,
				sheetTitle = UseLocalizationResult.gradYear,
				applyText = UseLocalizationResult.apply,
				value = p1.gradYear,
				defaultValue = SchoolMembersMockModule.ALL_YEARS,
				options = ReactModule.useMemo(function()
					-- upvalues: SchoolMembersMockModule (upval), UseLocalizationResult (copy), ClassYears (copy)
					local List = {
						{
							id = SchoolMembersMockModule.ALL_YEARS,
							text = UseLocalizationResult.allYears
						}
					}
					
					for _, classYear in ClassYears do
						table.insert(List, { id = tostring(classYear), text = tostring(classYear) })
					end
					return List
				end, { UseLocalizationResult.allYears, ClassYears }),
				onChanged = p1.onGradYearChanged
			})
		}),
		List = ReactModule.createElement(VerticalUserList, {
			isScrollEnabled = true,
			layoutOrder = 5,
			entities = p1.members,
			configs = Configs
		})
	})
end
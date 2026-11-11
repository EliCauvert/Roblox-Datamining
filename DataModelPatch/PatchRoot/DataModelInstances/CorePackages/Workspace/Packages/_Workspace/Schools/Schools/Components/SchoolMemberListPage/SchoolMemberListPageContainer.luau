local Schools = script:FindFirstAncestor("Schools")
local Parent = Schools.Parent
local ReactModule = require(Parent.React)
local SchoolMembersMockModule = require(Schools.Common.SchoolMembersMock)
local UseSchoolModule = require(Schools.Hooks.useSchool)
local UseClassYearsModule = require(Schools.Hooks.useClassYears)
local UseSchoolMembersModule = require(Schools.Hooks.useSchoolMembers)
local SchoolMemberListPageModule = require(script.Parent.SchoolMemberListPage)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local NavigateBackFunction = require(Parent.NavigationRodux).Thunks.NavigateBack

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseSchoolModule (copy), UseClassYearsModule (copy), ReactModule (copy), SchoolMembersMockModule (copy), UseSchoolMembersModule (copy), NavigateBackFunction (copy), SchoolMemberListPageModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local Navigation = p1.navigation
	local UseSchoolModuleResult = UseSchoolModule()
	local UseClassYearsModuleResult = UseClassYearsModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(SchoolMembersMockModule.ALL_YEARS)
	
	return ReactModule.createElement(SchoolMemberListPageModule, {
		schoolName = UseSchoolModuleResult.name,
		location = UseSchoolModuleResult.location,
		memberCount = UseSchoolModuleResult.memberCount,
		classYears = UseClassYearsModuleResult,
		members = UseSchoolMembersModule(UseStateResult),
		gradYear = UseStateResult,
		onGradYearChanged = ReactModule.useCallback(function(p2)
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(p2)
		end, {}),
		onBack = ReactModule.useCallback(function()
			-- upvalues: Navigation (copy), UseDispatchResult (copy), NavigateBackFunction (upval)
			if Navigation.isFocused() then
				UseDispatchResult(NavigateBackFunction())
			end
		end, { Navigation, UseDispatchResult })
	})
end
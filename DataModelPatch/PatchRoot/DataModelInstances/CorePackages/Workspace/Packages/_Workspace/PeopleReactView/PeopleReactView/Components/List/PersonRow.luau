local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local Parent = PeopleReactView.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local PeopleServiceModule = require(Parent.PeopleService)
local UserProfilesModule = require(Parent.UserProfiles)
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local Avatar = FoundationModule.Avatar
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local InputSize = FoundationModule.Enums.InputSize
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseSignalBindingFunction = require(Parent.SignalsReact).useSignalBinding
local UseDeviceOrientationFunction = require(Parent.RobloxAppHooks).useDeviceOrientation
local UseIsRobloxSubscriberFunction = UserProfilesModule.Hooks.useIsRobloxSubscriber
local UseInExperienceCombinedNameModule = require(PeopleReactView.Hooks.useInExperienceCombinedName)
local PlatformNameModule = require(PeopleReactView.Components.Buttons.PlatformName)
local PersonButtonRowModule = require(PeopleReactView.Components.List.PersonButtonRow)
local FormatUsernameFunction = UserProfilesModule.Formatters.formatUsername
local FFlagEnableBlackbirdCheck = require(Parent.SharedFlags).FFlagEnableBlackbirdCheck
local PlayerListRefactorUsernameFormatting = game:DefineFastFlag("PlayerListRefactorUsernameFormatting", false)
local GetFFlagAddPeoplePageCardLayoutFunction = PeopleServiceModule.getService("Flags").GetFFlagAddPeoplePageCardLayout

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseDeviceOrientationFunction (copy), RobloxAppEnumsModule (copy), FFlagEnableBlackbirdCheck (copy), UseIsRobloxSubscriberFunction (copy), ReactModule (copy), PeopleServiceModule (copy), GetFFlagAddPeoplePageCardLayoutFunction (copy), UseInExperienceCombinedNameModule (copy), UseSignalBindingFunction (copy), Avatar (copy), InputSize (copy), Text (copy), View (copy), Icon (copy), IconName (copy), IconSize (copy), PlayerListRefactorUsernameFormatting (copy), FormatUsernameFunction (copy), PersonButtonRowModule (copy), PlatformNameModule (copy)
	local UseTokensResult = UseTokensFunction()
	local IsUseDeviceOrientationResultMatch = UseDeviceOrientationFunction() == RobloxAppEnumsModule.DeviceOrientationMode.Portrait
	local UseIsRobloxSubscriberResult = if FFlagEnableBlackbirdCheck then UseIsRobloxSubscriberFunction((tostring(p1.person.UserId))) else nil
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(Current)
		-- upvalues: PeopleServiceModule (upval), p1 (copy), UseRefResult (copy)
		PeopleServiceModule.getService("FocusNavigationService").registerFrame(Current, p1.person.UserId)
		UseRefResult.current = Current
	end, { p1.person.UserId })
	local UseInExperienceCombinedNameModuleResult = nil
	
	if GetFFlagAddPeoplePageCardLayoutFunction() then
		UseInExperienceCombinedNameModuleResult = UseInExperienceCombinedNameModule(p1.person.UserId, p1.person.DisplayName)
	else
		local UseMemoResult = ReactModule.useMemo(function()
			-- upvalues: PeopleServiceModule (upval)
			return PeopleServiceModule.getService("PeopleListStore")
		end, {})
		UseInExperienceCombinedNameModuleResult = UseSignalBindingFunction((ReactModule.useMemo(function()
			-- upvalues: UseMemoResult (copy), p1 (copy)
			return UseMemoResult.getProfile(p1.person.UserId)
		end, { p1.person.UserId }))):map(function(Text: string)
			-- upvalues: p1 (copy)
			return if Text and string.len(Text) > 0 then Text else p1.person.DisplayName
		end)
	end
	local Element = ReactModule.createElement(Avatar, {
		LayoutOrder = 1,
		userId = p1.person.UserId,
		size = InputSize.Large,
		backgroundStyle = {
			Color3 = UseTokensResult.Color.Shift.Shift_300.Color3,
			Transparency = UseTokensResult.Color.Shift.Shift_300.Transparency
		}
	})
	local Element1 = ReactModule.createElement(Text, {
		tag = "text-label-medium auto-xy text-align-x-left text-truncate-end",
		LayoutOrder = 1,
		Text = UseInExperienceCombinedNameModuleResult,
		textStyle = { Color3 = UseTokensResult.Color.Content.Default.Color3 }
	})
	
	return ReactModule.createElement(View, {
		tag = {
			["padding-small row bg-surface-200 radius-medium"] = true,
			["size-full-2600 gap-medium"] = IsUseDeviceOrientationResultMatch,
			["size-full-1500"] = not IsUseDeviceOrientationResultMatch
		},
		LayoutOrder = p1.layoutOrder,
		ref = UseResult
	}, {
		PortraitAvatar = IsUseDeviceOrientationResultMatch and Element or nil,
		RowContent = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = {
				["gap-medium size-full align-y-center text-no-wrap"] = true,
				["flex-between row"] = not IsUseDeviceOrientationResultMatch,
				col = IsUseDeviceOrientationResultMatch
			}
		}, {
			LeftContent = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = {
					["row gap-medium align-y-center text-no-wrap"] = true,
					["size-full-0 auto-y"] = IsUseDeviceOrientationResultMatch,
					["size-0-full auto-x"] = not IsUseDeviceOrientationResultMatch
				}
			}, {
				Avatar = if IsUseDeviceOrientationResultMatch then nil else Element or nil,
				NameContainer = ReactModule.createElement(View, {
					tag = "col gap-small auto-xy flex-evenly",
					LayoutOrder = 2
				}, {
					DisplayName = if FFlagEnableBlackbirdCheck and UseIsRobloxSubscriberResult then ReactModule.createElement(View, {
						tag = "row gap-xsmall auto-xy align-y-center",
						LayoutOrder = 1
					}, {
						Name = Element1,
						SubscriptionBadge = ReactModule.createElement(Icon, {
							LayoutOrder = 2,
							name = IconName.RobloxPlus,
							size = IconSize.Small,
							style = { Color3 = UseTokensResult.Color.Content.Default.Color3 }
						})
					}) else Element1,
					UserName = ReactModule.createElement(Text, {
						tag = "text-caption-small auto-xy text-align-x-left content-muted text-truncate-end",
						LayoutOrder = 2,
						Text = if PlayerListRefactorUsernameFormatting then FormatUsernameFunction(p1.person.Name) else "@" .. p1.person.Name
					})
				})
			}),
			RightContent = ReactModule.createElement(View, {
				tag = "row auto-x size-0-1000 gap-medium",
				LayoutOrder = 2
			}, {
				PersonButtonRow = ReactModule.createElement(PersonButtonRowModule, {
					userId = p1.person.UserId,
					index = p1.layoutOrder,
					personRowRef = UseRefResult
				}),
				PlatformNameSection = ReactModule.createElement(PlatformNameModule, { UserId = p1.person.UserId })
			})
		})
	})
end
local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("MultiPageSignup").Parent
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local RoactNetworking = RoactServiceTagsModule.RoactNetworking
local RoactAnalytics = RoactServiceTagsModule.RoactAnalytics
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UserActivationFrameworkModule = require(Parent.UserActivationFramework)
local NonInteractiveActivationFrameworkWrapper = UserActivationFrameworkModule.Components.NonInteractiveActivationFrameworkWrapper
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local FetchSignupUserAgreementsFunction = require(Parent.UserAgreements).FetchSignupUserAgreements
local PayloadKey = UserActivationFrameworkModule.Enums.PayloadKey

return function(p1)
	-- upvalues: UseRoactServiceFunction (copy), RoactAnalytics (copy), RoactNetworking (copy), FetchSignupUserAgreementsFunction (copy), CryoModule (copy), HttpService (copy), PayloadKey (copy), ReactModule (copy), NonInteractiveActivationFrameworkWrapper (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactAnalytics)
	local UseRoactServiceResult1 = UseRoactServiceFunction(RoactNetworking)
	
	return ReactModule.createElement(NonInteractiveActivationFrameworkWrapper, {
		step = {
			onNonInteractiveStepExecution = function()
				-- upvalues: FetchSignupUserAgreementsFunction (upval), UseRoactServiceResult1 (copy), UseRoactServiceResult (copy), CryoModule (upval), HttpService (upval), PayloadKey (upval)
				local v1, Input = FetchSignupUserAgreementsFunction(UseRoactServiceResult1, UseRoactServiceResult):andThen(function(Result)
					-- upvalues: CryoModule (upval)
					return (CryoModule.List.map(Result, function(p2)
						return p2.id
					end))
				end):await()
				
				return if v1 then {
					errorOutput = nil,
					successPayloadAddendum = {
						[PayloadKey.SignupAgreedUserAgreements] = HttpService:JSONEncode(Input)
					}
				} else { successPayloadAddendum = nil, errorOutput = {} }
			end
		},
		navigation = p1.navigation
	})
end
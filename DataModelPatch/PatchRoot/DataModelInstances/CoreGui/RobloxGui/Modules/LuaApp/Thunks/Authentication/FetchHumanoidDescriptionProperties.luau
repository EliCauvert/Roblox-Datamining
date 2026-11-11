local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CryoModule = require(CorePackages.Packages.Cryo)
local PromiseModule = require(Modules.LuaApp.Promise)
local PromiseUtilities = require(CorePackages.Workspace.Packages.AppCommonLib).Utils.PromiseUtilities
local RetryModule = require(Modules.LuaApp.Thunks.Networking.Util.Retry)
local WebApiModule = require(Modules.AvatarExperience.AvatarEditor.Http.WebApi)
local HumanoidDescriptionPropertiesModule = require(Modules.LuaApp.Models.HumanoidDescriptionProperties)
local Largest = math.max(0, require(Modules.LuaApp.Flags.GetFIntLuaSignUpMaxRetries)())
local Largest1 = math.max(0, require(Modules.LuaApp.Flags.GetFIntLuaSignUpRetryTimeMultiplier)())
local SetHumanoidDescriptionPropertiesModule = require(Modules.LuaApp.Actions.Authentication.SetHumanoidDescriptionProperties)
local FFlagRemoveUnusedSignUpInfoRoduxSlice = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRemoveUnusedSignUpInfoRoduxSlice

return {
	Fetch = function(p1, p2)
		-- upvalues: CryoModule (copy), WebApiModule (copy), PromiseUtilities (copy), HumanoidDescriptionPropertiesModule (copy), FFlagRemoveUnusedSignUpInfoRoduxSlice (copy), SetHumanoidDescriptionPropertiesModule (copy), PromiseModule (copy), RetryModule (copy), Largest (copy), Largest1 (copy)
		return function(p3)
			-- upvalues: CryoModule (upval), p2 (copy), WebApiModule (upval), p1 (copy), PromiseUtilities (upval), HumanoidDescriptionPropertiesModule (upval), FFlagRemoveUnusedSignUpInfoRoduxSlice (upval), SetHumanoidDescriptionPropertiesModule (upval), PromiseModule (upval), RetryModule (upval), Largest (upval), Largest1 (upval)
			local JoinResult = CryoModule.List.join(p2)
			
			local function fetchOutfitDetails()
				-- upvalues: JoinResult (ref), WebApiModule (upval), p1 (upval), PromiseUtilities (upval), HumanoidDescriptionPropertiesModule (upval), FFlagRemoveUnusedSignUpInfoRoduxSlice (upval), p3 (copy), SetHumanoidDescriptionPropertiesModule (upval), PromiseModule (upval)
				local Outfits = {}
				
				for _, value in pairs(JoinResult) do
					Outfits[value] = WebApiModule.GetOutfit(p1, value)
				end
				return PromiseUtilities.Batch(Outfits):andThen(function(Result)
					-- upvalues: HumanoidDescriptionPropertiesModule (upval), FFlagRemoveUnusedSignUpInfoRoduxSlice (upval), p3 (upval), SetHumanoidDescriptionPropertiesModule (upval), PromiseModule (upval)
					local List = {}
					local FromOutfitDetailsWebApiResults = {}
					
					for i, value in pairs(Result) do
						local UnwrapResult, UnwrapResult2 = value:unwrap()
						local ResponseBody = UnwrapResult2 and UnwrapResult2.responseBody
						
						if UnwrapResult and ResponseBody then
							FromOutfitDetailsWebApiResults[tostring(i)] = HumanoidDescriptionPropertiesModule.fromOutfitDetailsWebApi(ResponseBody)
						else
							table.insert(List, i)
						end
					end
					if not FFlagRemoveUnusedSignUpInfoRoduxSlice then
						p3:dispatch(SetHumanoidDescriptionPropertiesModule(FromOutfitDetailsWebApiResults))
					end
					return PromiseModule.resolve(List)
				end)
			end
			
			return fetchOutfitDetails():andThen(function(Result)
				-- upvalues: RetryModule (upval), Largest (upval), Largest1 (upval), fetchOutfitDetails (copy), JoinResult (ref), CryoModule (upval)
				return RetryModule({
					retryCount = Largest,
					retryTimeMultiplier = Largest1,
					retryCallback = fetchOutfitDetails,
					previousResult = Result,
					isResolveConditionMet = function(p4): boolean
						-- upvalues: JoinResult (upval), CryoModule (upval)
						if #p4 == 0 then
							return true
						else
							JoinResult = CryoModule.List.join(p4)
							
							return false
						end
					end
				})
			end)
		end
	end
}
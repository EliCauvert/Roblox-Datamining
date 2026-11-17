local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local Parent = RobloxSubscriptionPurchaseApp.Parent
local Players = game:GetService("Players")
local PromiseModule = require(Parent.Promise)
local Url = require(Parent.Http).Url
local HttpRequestModule = require(script.Parent.HttpRequest)
local _ = require(RobloxSubscriptionPurchaseApp.types)
local Callback = nil

local function parseEvaluationValue(Key)
	-- upvalues: Callback (ref)
	return if type(Key) == "table" then if Key.boolValue == nil then if Key.stringValue == nil then if Key.doubleValue == nil then if Key.int64Value == nil then if Key.mapValue == nil then Key else Callback(Key.mapValue) else tonumber(Key.int64Value) or Key.int64Value else Key.doubleValue else Key.stringValue else Key.boolValue else nil
end

Callback = function(MapValue)
	-- upvalues: parseEvaluationValue (copy)
	if type(MapValue) ~= "table" then
		return nil
	end
	local Entries = MapValue.entries
	
	if Entries == nil then
		return {}
	end
	if type(Entries) ~= "table" then
		return nil
	end
	local t = {}
	
	for _, entry in Entries do
		if type(entry) ~= "table" then
			return nil
		end
		local ParseEvaluationValueResult = parseEvaluationValue(entry.key)
		
		if type(ParseEvaluationValueResult) ~= "string" then
			return nil
		end
		local ParseEvaluationValueResult1 = parseEvaluationValue(entry.value)
		
		if ParseEvaluationValueResult1 == nil then
			return nil
		end
		t[ParseEvaluationValueResult] = ParseEvaluationValueResult1
	end
	return t
end

local function findMembershipResult(p1)
	if type(p1) ~= "table" then
		return nil
	end
	local EvaluationResponses = p1.evaluationResponses
	
	if type(EvaluationResponses) ~= "table" then
		return nil
	end
	for _, evaluationRespons in EvaluationResponses do
		if type(evaluationRespons) == "table" then
			local Request = evaluationRespons.request
			
			if type(Request) == "table" and Request.fullFeatureName == "subscriptions/PlusSubscription.RobloxSubscriptionMembership" then
				return evaluationRespons.result
			end
		end
	end
	return nil
end

return function()
	-- upvalues: Players (copy), PromiseModule (copy), HttpRequestModule (copy), Url (copy), findMembershipResult (copy), Callback (ref)
	local LocalPlayer = Players.LocalPlayer
	
	return if LocalPlayer == nil then PromiseModule.resolve(nil) else HttpRequestModule.new():post(Url.APIS_URL .. "access-management/v2/feature-evaluation", {
		{
			featureName = "RobloxSubscriptionMembership",
			namespace = "subscriptions/PlusSubscription",
			userId = LocalPlayer.UserId
		}
	}):andThen(function(Result)
		-- upvalues: findMembershipResult (upval), Callback (upval)
		local MembershipResult = findMembershipResult(Result)
		
		return if type(MembershipResult) == "table" and MembershipResult.errorValue == nil then Callback(MembershipResult.mapValue) else nil
	end):catch(function()
		-- upvalues: PromiseModule (upval)
		return PromiseModule.resolve(nil)
	end)
end
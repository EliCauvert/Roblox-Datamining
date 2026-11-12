local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local Parent = AmpV2Wizard.Parent
local HttpService = game:GetService("HttpService")
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local UrlBase = require(Parent.UrlBuilder).UrlBase
local FetchModule = require(Parent.Fetch)
local PromiseModule = require(Parent.Promise)
local FetchFunction = FetchModule.fetch
local Response = FetchModule.Response
local _ = require(AmpV2Wizard.Types)
local NewUrlBuilder = UrlBuilder.new({
	path = "amp-v2-wizard-service/v1/entrypoint",
	base = UrlBase.APIS
})
local NewUrlBuilder1 = UrlBuilder.new({
	path = "amp-v2-wizard-service/v1/continue",
	base = UrlBase.APIS
})

local function postForFragment(p1, Input)
	-- upvalues: PromiseModule (copy), FetchFunction (copy), HttpService (copy), Response (copy)
	return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ())
		-- upvalues: FetchFunction (upval), p1 (copy), HttpService (upval), Input (copy), Response (upval)
		local v1 = FetchFunction(p1, {
			method = "POST",
			body = HttpService:JSONEncode(Input),
			headers = { ["Content-Type"] = "application/json" }
		}):catch(function()
			-- upvalues: Response (upval)
			return Response.error()
		end):expect()
		
		if not v1.ok then
			Callback(`Wizard flow request failed with status: {v1.status}`)
			
			return
		end
		local v2 = v1:json():catch(function()
			return nil
		end):expect()
		
		if v2 then
			Callback1(v2)
			
			return
		else
			Callback("Failed to decode wizard flow response as JSON")
		end
	end)
end

local function _(p1)
	return {
		target = p1.target,
		flow = p1.flow,
		surface = p1.surface,
		client = p1.client,
		extraProps = p1.extraProps
	}
end

local _ = function(p1)
	return {
		flowId = p1.flowId,
		state = p1.state,
		target = p1.target,
		rootFlow = p1.rootFlow,
		flowInputs = p1.flowInputs,
		history = p1.history,
		payload = p1.payload
	}
end

return {
	entrypoint = function(p1)
		-- upvalues: postForFragment (copy), NewUrlBuilder (copy)
		return postForFragment(NewUrlBuilder(), {
			target = p1.target,
			flow = p1.flow,
			surface = p1.surface,
			client = p1.client,
			extraProps = p1.extraProps
		})
	end,
	["continue"] = function(p1)
		-- upvalues: postForFragment (copy), NewUrlBuilder1 (copy)
		return postForFragment(NewUrlBuilder1(), {
			flowId = p1.flowId,
			state = p1.state,
			target = p1.target,
			rootFlow = p1.rootFlow,
			flowInputs = p1.flowInputs,
			history = p1.history,
			payload = p1.payload
		})
	end
}
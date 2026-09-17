local viewportAutoplayRowSpanAttributeModule = require(script:FindFirstAncestor("VideoUtils").ViewportAutoplayRowSpanAttribute)

return {
	getTileRowSpan = function(p1)
		-- upvalues: viewportAutoplayRowSpanAttributeModule (ref)
		local var1 = p1:GetAttribute(viewportAutoplayRowSpanAttributeModule)
		
		return if typeof(var1) == "number" and var1 > 0 then math.floor(var1) else 1
	end
}
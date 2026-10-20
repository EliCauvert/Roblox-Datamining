return {
	WhyThisAdModal = if require(script.Parent.SharedFlags).FFlagLuaAppEnableWhyThisAdModal then require(script.WhyThisAdModal) else nil
}
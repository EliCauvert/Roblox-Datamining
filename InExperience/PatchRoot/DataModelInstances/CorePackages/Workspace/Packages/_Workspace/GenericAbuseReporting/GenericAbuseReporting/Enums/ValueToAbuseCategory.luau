local abuseCategoryModule = require(script:FindFirstAncestor("GenericAbuseReporting").Enums.AbuseCategory)

return {
	[0] = abuseCategoryModule.ABUSE_CATEGORY_INVALID,
	[1] = abuseCategoryModule.ABUSE_CATEGORY_SWEARING,
	[2] = abuseCategoryModule.ABUSE_CATEGORY_BULLYING,
	[3] = abuseCategoryModule.ABUSE_CATEGORY_SCAMMING,
	[4] = abuseCategoryModule.ABUSE_CATEGORY_DATING,
	[5] = abuseCategoryModule.ABUSE_CATEGORY_CHEATING,
	[6] = abuseCategoryModule.ABUSE_CATEGORY_INAPT_CONTENT,
	[7] = abuseCategoryModule.ABUSE_CATEGORY_INAPPROPRIATE_USERNAME,
	[8] = abuseCategoryModule.ABUSE_CATEGORY_OFFSITE_LINKS,
	[9] = abuseCategoryModule.ABUSE_CATEGORY_PERSONAL_QUESTION,
	[10] = abuseCategoryModule.ABUSE_CATEGORY_INAPPROPRIATE_LANGUAGE_PROFANITY_AND_ADULT_CONTENT,
	[11] = abuseCategoryModule.ABUSE_CATEGORY_EXPLOITING_CHEATING_SCAMMING,
	[12] = abuseCategoryModule.ABUSE_CATEGORY_ACCOUNT_THEFT,
	[13] = abuseCategoryModule.ABUSE_CATEGORY_REAL_LIFE_THREATS_AND_SUICIDE_THREATS,
	[14] = abuseCategoryModule.ABUSE_CATEGORY_INACCURATE_AGE_GUIDELINES,
	[15] = abuseCategoryModule.ABUSE_CATEGORY_OTHER,
	[16] = abuseCategoryModule.ABUSE_CATEGORY_SPAMMING,
	[18] = abuseCategoryModule.ABUSE_CATEGORY_HATE_SPEECH,
	[24] = abuseCategoryModule.ABUSE_CATEGORY_VIOLENCE_OR_TERRORISM
}
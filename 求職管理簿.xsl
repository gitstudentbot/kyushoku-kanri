<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns:fo="http://www.w3.org/1999/XSL/Format">

<xsl:attribute-set name="cell-base">
	<xsl:attribute name="border">0.8pt solid</xsl:attribute>
	<xsl:attribute name="display-align">center</xsl:attribute>
</xsl:attribute-set>
<xsl:attribute-set name="top-less">
	<xsl:attribute name="border-bottom">0.8pt solid</xsl:attribute>
	<xsl:attribute name="border-right">0.8pt solid</xsl:attribute>
	<xsl:attribute name="border-left">0.8pt solid</xsl:attribute>
	<xsl:attribute name="display-align">center</xsl:attribute>
</xsl:attribute-set>
<xsl:attribute-set name="right-less">
	<xsl:attribute name="border-bottom">0.8pt solid</xsl:attribute>
	<xsl:attribute name="border-top">0.8pt solid</xsl:attribute>
	<xsl:attribute name="border-left">0.8pt solid</xsl:attribute>
	<xsl:attribute name="display-align">center</xsl:attribute>
</xsl:attribute-set>
<xsl:attribute-set name="left-less">
	<xsl:attribute name="border-bottom">0.8pt solid</xsl:attribute>
	<xsl:attribute name="border-right">0.8pt solid</xsl:attribute>
	<xsl:attribute name="border-left">0.8pt solid</xsl:attribute>
	<xsl:attribute name="display-align">center</xsl:attribute>
</xsl:attribute-set>

<!-- =========================================================== -->
<!-- Root                                                        -->
<!-- =========================================================== -->
	<xsl:template match="Sales">
		<fo:root font-size="9pt" font-family="IPA Gothic, IPAGothic">
			<fo:layout-master-set>
				<fo:simple-page-master master-name="A4" page-width="297mm" page-height="210mm"
					margin-top="5mm" margin-bottom="5mm" margin-left="10mm" margin-right="10mm">
					<fo:region-body margin-top="50mm" margin-bottom="5mm" margin-left="10mm" margin-right="10mm"/>
					<fo:region-before extent="40mm"/>
				</fo:simple-page-master>
			</fo:layout-master-set>

			<xsl:for-each select="Item">
				<fo:page-sequence master-reference="A4">
					<!--ヘッダー header-->
					<fo:static-content flow-name="xsl-region-before">
						<fo:block text-align="center" font-size="24pt" margin-top="25mm">求 職 管 理 簿</fo:block>
						<!--logo-->
						<fo:block-container absolute-position="absolute">
							<fo:block text-align="right" margin-right="2mm">
								<fo:external-graphic src="logo.png" content-height="scale-down-to-fit"
								content-width="scale-down-to-fit" height="20mm" width="50mm"/>
							</fo:block>
						</fo:block-container>
					</fo:static-content>

					<fo:flow flow-name="xsl-region-body">
						<fo:block space-after="2mm">
							<fo:inline-container width="50%" text-align="left">
								<fo:block font-size="10pt">
									<xsl:value-of select="Sales.U_329EF86EC8EC8534AD35E8EE04633B"/>
								</fo:block>
							</fo:inline-container>
							<fo:inline-container width="50%" text-align="right">
								<fo:block font-size="10pt">
									【有効期間の終了後２年間保存】
								</fo:block>
							</fo:inline-container>
						</fo:block>

						<fo:table table-layout="fixed" width="100%">
							<fo:table-column column-width="13%"/>
							<fo:table-column column-width="34%"/>
							<fo:table-column column-width="13%"/>
							<fo:table-column column-width="40%"/>
							<fo:table-body>
								<fo:table-row height="15mm">
									<fo:table-cell border-top="1.5pt solid" border-bottom="1.5pt solid" border-left="1.5pt solid" display-align="center" border-right="0.8pt solid">
										<fo:block text-align="center">
											①受付
										</fo:block>
										<fo:block text-align="center">
											年月日
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border-bottom="1.5pt solid" border-right="0.8pt solid" border-top="1.5pt solid" display-align="center">
										<fo:block text-align="center" font-size="11pt">
											②求職者に係る氏名・住所・生年月日
										</fo:block>
									</fo:table-cell>
									<fo:table-cell border-bottom="1.5pt solid" border-right="0.8pt solid" border-top="1.5pt solid" display-align="center">
										<fo:block text-align="center">
											③有効期間/
										</fo:block>
										<fo:block text-align="center" font-size="11pt">
											紹介年月日
										</fo:block>
									</fo:table-cell>
									<fo:table-cell display-align="center" border-right="1.5pt solid" border-bottom="1.5pt solid" border-top="1.5pt solid" >
										<fo:block text-align="center" font-size="11pt">
											④職業紹介の取扱状況
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell display-align="center" border-left="1.5pt solid" border-bottom="1.5pt solid" number-rows-spanned="2">
										<fo:block text-align="center">
											<xsl:value-of select="Sales.U_6170B623017E191B4AA765AB985586"/>
										</fo:block>
									</fo:table-cell>
									<!--ネストテーブル１-->
									<fo:table-cell display-align="before">
										<fo:block>
											<fo:table table-layout="fixed" width="100%">
												<fo:table-column column-number="1" column-width="20%"/>
												<fo:table-column column-number="2" column-width="80%"/>
												<fo:table-body>
													<fo:table-row height="10mm">
														<fo:table-cell xsl:use-attribute-sets="top-less">
															<fo:block text-align="center">
																氏名
															</fo:block>
														</fo:table-cell>
														<fo:table-cell xsl:use-attribute-sets="top-less">
															<fo:block text-align="left" padding-left="1mm">
																<xsl:value-of select="Sales.P_Resume/Resume/Resume.P_Name"/>
															</fo:block>
														</fo:table-cell>
													</fo:table-row>
													<fo:table-row height="20.3mm">
														<fo:table-cell xsl:use-attribute-sets="cell-base">
															<fo:block text-align="center">
																住所
															</fo:block>
														</fo:table-cell>
														<fo:table-cell xsl:use-attribute-sets="cell-base">
															<fo:block text-align="left">
																<fo:inline>
																	〒<xsl:value-of select="Process.P_Resume/Resume/Resume.P_Candidate/Candidate/Person.P_Zipcode"/>
																</fo:inline>
																<fo:inline>
																	<xsl:variable name="pref" select="normalize-space(Process.P_Resume/Resume/Resume.P_Candidate/Candidate/Person.U_6E906CC3D68B8B4F24A2BA8C5398E7)"/>
																	<xsl:variable name="addr" select="normalize-space(Process.P_Resume/Resume/Resume.P_Candidate/Candidate/Person.P_Street)"/>
																	<xsl:choose>
																	<xsl:when test="string-length($pref) &gt; 0 and substring($addr, 1, string-length($pref)) = $pref">
																		<xsl:value-of select="$pref"/>
																		<xsl:value-of select="substring($addr, string-length($pref) + 1)"/>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:value-of select="concat($pref, $addr)"/>
																	</xsl:otherwise>
																	</xsl:choose>
																</fo:inline>
															</fo:block>
														</fo:table-cell>
													</fo:table-row>
													<fo:table-row height="8mm">
														<fo:table-cell xsl:use-attribute-sets="cell-base">
															<fo:block text-align="center">
																生年月日
															</fo:block>
														</fo:table-cell>
														<fo:table-cell xsl:use-attribute-sets="cell-base">
															<fo:block text-align="left">
																<xsl:value-of select="Sales.P_Resume/Resume/Resume.P_DateOfBirth"/>
															</fo:block>
														</fo:table-cell>
													</fo:table-row>
													<fo:table-row height="7.7mm">
														<fo:table-cell xsl:use-attribute-sets="cell-base">
															<fo:block text-align="center">
																希望職種
															</fo:block>
														</fo:table-cell>
														<fo:table-cell xsl:use-attribute-sets="cell-base">
															<fo:block text-align="left">
																<xsl:value-of select="Sales.P_Resume/Resume/Resume.P_ExpectJobCategory"/>
															</fo:block>
														</fo:table-cell>
													</fo:table-row>
												</fo:table-body>
											</fo:table>
										</fo:block>
										<!--ネストテーブル１終了-->
									</fo:table-cell>
									<fo:table-cell>
										<!--ネストテーブル２-->
										<fo:block>
											<fo:table table-layout="fixed" width="100%">
												<fo:table-body>
													<fo:table-row height="10mm">
														<fo:table-cell xsl:use-attribute-sets="top-less">
															<fo:block text-align="center">
																有効期限
															</fo:block>
														</fo:table-cell>
													</fo:table-row>
													<fo:table-row height="12mm">
														<fo:table-cell xsl:use-attribute-sets="cell-base">
															<fo:block text-align="center">
																<xsl:value-of select="Sales.P_Job/Job/Job.U_357A3EFEBC41DBEB7CC3BAFEC669BB"/>
															</fo:block>
														</fo:table-cell>
													</fo:table-row>
													<fo:table-row height="8mm">
														<fo:table-cell xsl:use-attribute-sets="cell-base">
															<fo:block text-align="center">
																紹介年月日
															</fo:block>
														</fo:table-cell>
													</fo:table-row>
													<fo:table-row height="16mm">
														<fo:table-cell xsl:use-attribute-sets="cell-base">
															<fo:block text-align="center">
																<xsl:value-of select="Sales.U_E538E1626180614856ADE9D08F0552"/>
															</fo:block>
														</fo:table-cell>
													</fo:table-row>
												</fo:table-body>
											</fo:table>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<!--ネストテーブル３-->
										<fo:block>
											<fo:table table-layout="fixed" width="100%">
												<fo:table-column column-number="1" column-width="20%"/>
												<fo:table-column column-number="2" column-width="25%"/>
												<fo:table-column column-number="3" column-width="55%"/>
												<fo:table-body>
													<fo:table-row height="24.8mm">
														<fo:table-cell xsl:use-attribute-sets="top-less">
															<fo:block text-align="center">
																求人受理
															</fo:block>
															<fo:block text-align="center">
																番号
															</fo:block>
														</fo:table-cell>
														<fo:table-cell xsl:use-attribute-sets="top-less">
															<fo:block text-align="center">
																求人者の
															</fo:block>
															<fo:block text-align="center">
																氏名/名称
															</fo:block>
														</fo:table-cell>
														<fo:table-cell xsl:use-attribute-sets="top-less">
															<fo:block text-align="center">
																<xsl:value-of select="Sales.P_Recruiter/Recruiter/Recruiter.P_Name"/>
															</fo:block>
														</fo:table-cell>
													</fo:table-row>
													<fo:table-row height="8mm">
														<fo:table-cell xsl:use-attribute-sets="cell-base" number-rows-spanned="2">
															<fo:block text-align="center">
																<xsl:value-of select="translate(Sales.U_6170B623017E191B4AA765AB985586, '/', '')"/>
															</fo:block>
														</fo:table-cell>
														<fo:table-cell xsl:use-attribute-sets="cell-base">
															<fo:block text-align="center">
																顛末内容
															</fo:block>
														</fo:table-cell>
														<fo:table-cell xsl:use-attribute-sets="cell-base">
															<fo:block text-align="center">
																<xsl:value-of select="Sales.U_3EDE5A36BDE9707996E2FBAC9330F6"/>
															</fo:block>
														</fo:table-cell>
													</fo:table-row>
													<fo:table-row height="13.5mm">

														<fo:table-cell xsl:use-attribute-sets="cell-base">
															<fo:block text-align="center">
																採用年月日
															</fo:block>
														</fo:table-cell>
														<fo:table-cell xsl:use-attribute-sets="cell-base">
															<fo:block text-align="center">
																<xsl:value-of select="Sales.U_0EB4A080A12912811EDE9ADFA9AD6F"/>
															</fo:block>
														</fo:table-cell>
													</fo:table-row>
												</fo:table-body>
											</fo:table>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<!--ネストテーブル３終了-->
								<fo:table-row height="20mm">
									<fo:table-cell xsl:use-attribute-sets="cell-base" >
										<fo:block>
											
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:flow>
				</fo:page-sequence>
			</xsl:for-each>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>
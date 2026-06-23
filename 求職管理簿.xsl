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
<xsl:attribute-set name="bot-less">
	<xsl:attribute name="border-top">0.8pt solid</xsl:attribute>
	<xsl:attribute name="border-right">0.8pt solid</xsl:attribute>
	<xsl:attribute name="border-left">0.8pt solid</xsl:attribute>
	<xsl:attribute name="display-align">center</xsl:attribute>
</xsl:attribute-set>


<!-- 備考テキストを固定文字数で行分割するテンプレート -->
<xsl:template name="split-remark-by-length">
  <xsl:param name="text"/>
  <xsl:param name="chars-per-line"/>
  <xsl:param name="remaining-rows"/>

  <xsl:choose>
    <!-- 残り行数が0なら終了 -->
    <xsl:when test="$remaining-rows &lt;= 0"/>

    <!-- テキストがまだ残っている場合 -->
    <xsl:when test="string-length($text) &gt; 0">
      <fo:table-row height="7mm">
        <fo:table-cell display-align="center" border-bottom="0.8pt solid">
          <fo:block text-align="left" padding-left="1mm">
            <xsl:value-of select="substring($text, 1, $chars-per-line)"/>
          </fo:block>
        </fo:table-cell>
      </fo:table-row>
      <!-- 残りのテキストで再帰 -->
      <xsl:call-template name="split-remark-by-length">
        <xsl:with-param name="text" select="substring($text, $chars-per-line + 1)"/>
        <xsl:with-param name="chars-per-line" select="$chars-per-line"/>
        <xsl:with-param name="remaining-rows" select="$remaining-rows - 1"/>
      </xsl:call-template>
    </xsl:when>

    <!-- テキストが尽きたら残りを空行で埋める -->
    <xsl:otherwise>
      <xsl:call-template name="empty-remark-rows">
        <xsl:with-param name="count" select="$remaining-rows"/>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<!-- 空の罫線行を出力する補助テンプレート -->
<xsl:template name="empty-remark-rows">
  <xsl:param name="count"/>
  <xsl:if test="$count &gt; 0">
    <fo:table-row height="7mm">
      <fo:table-cell display-align="center" border-bottom="0.8pt solid">
        <fo:block/>
      </fo:table-cell>
    </fo:table-row>
    <xsl:call-template name="empty-remark-rows">
      <xsl:with-param name="count" select="$count - 1"/>
    </xsl:call-template>
  </xsl:if>
</xsl:template>


<!-- =========================================================== -->
<!-- Root                                                        -->
<!-- =========================================================== -->
	<xsl:template match="Sales">
		<fo:root font-size="9pt" font-family="IPA Gothic, IPAGothic, Segoe UI Symbol">
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
										<fo:block text-align="center" font-size="11pt">
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
															<fo:block text-align="left">
																<fo:inline padding-left="1mm">
																	<xsl:value-of select="Sales.P_Resume/Resume/Resume.P_Name"/>
																</fo:inline>
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
																<fo:inline padding-left="1mm">
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
																<fo:inline padding-left="1mm">
																	<xsl:value-of select="Sales.P_Resume/Resume/Resume.P_DateOfBirth"/>
																</fo:inline>
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
																<fo:inline padding-left="1mm">
																	<xsl:value-of select="Sales.P_Resume/Resume/Resume.P_ExpectJobCategory"/>   <!--レジュメ？？？？？-->
																</fo:inline>
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
														<fo:table-cell display-align="center" border-right="1.5pt solid">
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
														<fo:table-cell xsl:use-attribute-sets="right-less" border-right="1.5pt solid">
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
														<fo:table-cell xsl:use-attribute-sets="right-less" border-right="1.5pt solid">
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

								<fo:table-row>
									<!--ネストテーブル４（親要素３列分をいっぱいに使い、proportional-widthを使ってその中で自由に幅を設定）-->
									<fo:table-cell number-columns-spanned="3">
										<fo:block>
											<fo:table table-layout="fixed" width="100%">
												<fo:table-column column-number="1" column-width="proportional-column-width(20)"/>
												<fo:table-column column-number="2" column-width="proportional-column-width(35)"/>
												<fo:table-column column-number="3" column-width="proportional-column-width(32)"/>
												<fo:table-body>
													<!--1行目：題タイトル行-->
													<fo:table-row height="15mm">
														<fo:table-cell xsl:use-attribute-sets="cell-base">
															<fo:block text-align="center" font-size="11pt">
																⑤雇用期間
															</fo:block>
														</fo:table-cell>
														<fo:table-cell xsl:use-attribute-sets="bot-less">
															<fo:block font-size="11pt" text-align="center">
																⑥無期雇用就職者に関する事項等
															</fo:block>
														</fo:table-cell>
														<fo:table-cell xsl:use-attribute-sets="right-less" border-right="1.5pt solid">
															<fo:block text-align="center" font-size="11pt">
																⑦備考
															</fo:block>
														</fo:table-cell>
													</fo:table-row>
													
													<!--2行目：コンテンツ行-->
													<fo:table-row>
														<fo:table-cell xsl:use-attribute-sets="right-less" height="14.3mm">
															<fo:block text-align="center">
																<xsl:value-of select="Sales.U_329EF86EC8EC8534AD35E8EE04633B"/>
															</fo:block>
														</fo:table-cell>

														<!--２列目２行目の小テーブル-->
														<fo:table-cell number-rows-spanned="2">
															<fo:block>
																<fo:table table-layout="fixed" width="100%">
																	<fo:table-column column-width="proportional-column-width(14)"/>
																	<fo:table-column column-width="proportional-column-width(21)"/>
																	<fo:table-body>
																		<fo:table-row height="7mm">
																			<fo:table-cell xsl:use-attribute-sets="cell-base">
																				<fo:block text-align="center">
																					無期雇用である旨
																				</fo:block>
																			</fo:table-cell>
																			<fo:table-cell xsl:use-attribute-sets="cell-base">
																				<fo:block text-align="center" font-family="Segoe UI Symbol">
																					<xsl:value-of select="Sales.U_CA4F6B79F208433852C3B91A14C7BB"/>
																				</fo:block>
																			</fo:table-cell>
																		</fo:table-row>

																		<fo:table-row height="7mm">
																			<fo:table-cell xsl:use-attribute-sets="cell-base">
																				<fo:block text-align="center">
																					転職勧奨禁止期間
																				</fo:block>
																			</fo:table-cell>
																			<fo:table-cell xsl:use-attribute-sets="cell-base">
																				<fo:block text-align="center">
																					<xsl:if test="Sales.U_CA4F6B79F208433852C3B91A14C7BB = '○'">
																						<!--年月日の正規化-->
																						<xsl:variable name="datestr" select="Sales.U_0EB4A080A12912811EDE9ADFA9AD6F"/>
																						<xsl:variable name="year" select="substring($datestr, 1, 4)"/>
																						<xsl:variable name="month" select="substring($datestr, 6, 2)"/>
																						<xsl:variable name="day" select="substring($datestr, 9, 2)"/>
																						<!--＋２年ー１日の計算-->
																						<xsl:variable name="newyear" select="number($year) + 2"/>
																						<xsl:variable name="newday" select="number($day) - 1 "/>

																						<xsl:choose>
																							<!--日が０になる場合（元の日が１）は前月の末日に繰り下げる-->
																							<xsl:when test="$newday = 0">
																								<xsl:variable name="prevmonth" select="number($month) - 1"/>
																								<xsl:variable name="adyear">
																									<xsl:choose>
																										<xsl:when test="$prevmonth = 0">
																											<xsl:value-of select="$newyear - 1"/>
																										</xsl:when>
																										<xsl:otherwise>
																											<xsl:value-of select="$newyear"/>
																										</xsl:otherwise>
																									</xsl:choose>
																								</xsl:variable>

																								<xsl:variable name="admonth">
																									<xsl:choose>
																										<xsl:when test="$prevmonth = 0">
																											12
																										</xsl:when>
																										<xsl:otherwise>
																											<xsl:value-of select="$prevmonth"/>
																										</xsl:otherwise>
																									</xsl:choose>
																								</xsl:variable>
																								
																								<!--各月の末日を正規化-->
																								<xsl:variable name="lastday">
																									<xsl:choose>
																										<xsl:when test="$admonth=1 or $admonth=3 or $admonth=5 or $admonth=7 or $admonth=8 or $admonth=10 or $admonth=12">
																											31
																										</xsl:when>
																										<xsl:when test="$admonth=4 or $admonth=6 or $admonth=9 or $admonth=11">
																											30
																										</xsl:when>
																										<xsl:when test="$admonth=2">
																											<xsl:choose>
																												<xsl:when test="($adyear mod 4 = 0 and $adyear mod 100 != 0) or $adyear mod 400 = 0">
																													29
																												</xsl:when>
																												<xsl:otherwise>
																													28
																												</xsl:otherwise>
																											</xsl:choose>
																										</xsl:when>
																									</xsl:choose>
																								</xsl:variable>

																								<xsl:value-of select="$adyear"/>
																								<xsl:text>年</xsl:text>
																								<xsl:value-of select="format-number($admonth, '00')"/>
																								<xsl:text>月</xsl:text>
																								<xsl:value-of select="$lastday"/>
																								<xsl:text>日</xsl:text>
																							</xsl:when>
																							<xsl:otherwise>
																								<xsl:value-of select="$newyear"/>
																								<xsl:text>年</xsl:text>
																								<xsl:value-of select="$month"/>
																								<xsl:text>月</xsl:text>
																								<xsl:value-of select="format-number($newday, '00')"/>
																								<xsl:text>日</xsl:text>
																							</xsl:otherwise>
																						</xsl:choose>
																					</xsl:if>
																				</fo:block>
																			</fo:table-cell>
																		</fo:table-row>
																		
																		<fo:table-row height="7mm">
																			<fo:table-cell xsl:use-attribute-sets="cell-base">
																				<fo:block text-align="center">
																					６か月後の離職状況
																				</fo:block>
																			</fo:table-cell>
																			<fo:table-cell xsl:use-attribute-sets="cell-base">
																				<fo:block text-align="center">
																					<xsl:value-of select="Sales.U_DFC5378E845756D45FA455995888D0"/>
																				</fo:block>
																			</fo:table-cell>
																		</fo:table-row>

																		<fo:table-row height="7mm">
																			<fo:table-cell xsl:use-attribute-sets="cell-base">
																				<fo:block text-align="center">
																					調査日
																				</fo:block>
																			</fo:table-cell>
																			<fo:table-cell xsl:use-attribute-sets="cell-base">
																				<fo:block text-align="center">
																					<xsl:value-of select="Sales.U_93179391C625B751EAC8541AED35C6"/>
																				</fo:block>
																			</fo:table-cell>
																		</fo:table-row>

																		<fo:table-row height="7mm">
																			<fo:table-cell xsl:use-attribute-sets="cell-base">
																				<fo:block text-align="center">
																					調査方法
																				</fo:block>
																			</fo:table-cell>
																			<fo:table-cell xsl:use-attribute-sets="cell-base">
																				<fo:block text-align="center">
																					<xsl:value-of select="Sales.U_58CFE82CBB287B4139F5808ED45CB1"/>
																				</fo:block>
																			</fo:table-cell>
																		</fo:table-row>

																		<fo:table-row height="7mm">
																			<fo:table-cell xsl:use-attribute-sets="bot-less" border-bottom="1.5pt solid">
																				<fo:block text-align="center">
																					返戻金
																				</fo:block>
																			</fo:table-cell>
																			<fo:table-cell xsl:use-attribute-sets="bot-less" border-bottom="1.5pt solid">
																				<fo:block text-align="center">
																					<xsl:value-of select="Sales.U_3734D1C4545D592240C9EE547B06AA"/>
																				</fo:block>
																			</fo:table-cell>
																		</fo:table-row>
																	</fo:table-body>
																</fo:table>
															</fo:block>
														</fo:table-cell>
														<!--２行目２列目のテーブル終了-->

														<!--２行目３列目の備考欄テーブル-->
														<fo:table-cell number-rows-spanned="2" border-bottom="1.5pt solid" border-right="1.5pt solid">
															<fo:block>
																<fo:table table-layout="fixed" width="100%">
																	<fo:table-column column-width="100%"/>
																	<fo:table-body>
																	<!--1行目からデータを文字数で分割-->
																		<xsl:call-template name="split-remark-by-length">
																			<xsl:with-param name="text" select="Sales.U_F3869106411B748504B11CBADB207E"/>
																			<xsl:with-param name="chars-per-line" select="25"/>
																			<xsl:with-param name="remaining-rows" select="5"/>
																		</xsl:call-template>
																	</fo:table-body>
																</fo:table>
															</fo:block>
														</fo:table-cell>
													</fo:table-row>
														

													<!--空セルに斜線-->
													<fo:table-row height="22mm">
														<fo:table-cell border-bottom="1.5pt solid" border-left="0.8pt solid"
																					 padding="0pt">
															<fo:block-container absolute-position="absolute"
																									top="0mm" left="0mm"
																									width="51mm" height="29mm">
																<fo:block line-height="0pt" font-size="0pt">
																	<fo:instream-foreign-object
																			content-width="51mm"
																			content-height="29mm"
																			scaling="non-uniform">
																		<svg xmlns="http://www.w3.org/2000/svg"
																				 viewBox="0 0 100 100"
																				 preserveAspectRatio="none">
																			<line x1="0" y1="0" x2="100" y2="100"
																						stroke="black" stroke-width="0.8"/>
																		</svg>
																	</fo:instream-foreign-object>
																</fo:block>
															</fo:block-container>
															<fo:block/>
														</fo:table-cell>
													</fo:table-row>
													
													
												</fo:table-body>
											</fo:table>
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